import axios from "axios";
import qs from "qs";
import crypto from "crypto";
import jwt from "jsonwebtoken";
import { patientSearch, toFHIR } from "./patientSearch";
import { patientCreate } from "./patientCreate";
import { getClinicalSummary } from "./getPatientClinicalSummary";

export interface RequestParams {
  firstName?: string;
  lastName?: string;
  dob?: string;
  gender?: string;
  email?: string;
  address?: string;
  city?: string;
  zip?: string;
  state?: string;
  patientid?: string;
  destinationid?: string;
  docid?: string;
}

export const getAccessToken = async () => {
  const authConfig = {
    url: "https://api.redoxengine.com/auth/authenticate",
    headers: {
      "Content-Type": "application/json",
    },
    json: true,
  };
  const auth_response = await axios.post(
    "https://api.redoxengine.com/auth/authenticate",
    {
      apiKey: process.env.REDOX_API_KEY,
      secret: process.env.REDOX_API_SECRET,
    },
    authConfig
  );
  const access_token = auth_response.data.accessToken;

  return access_token;
};

export const postToRedox = async (
  datamodelCommand: string,
  access_token: string,
  requestParams: RequestParams
) => {
  // const access_token = await getAccessToken();

  const fn = {
    patientSearch: patientSearch,
    patientCreate: patientCreate,
    getClinicalSummary: getClinicalSummary,
  }[datamodelCommand];

  const body: any = fn(requestParams);

  const config = {
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${access_token}`,
    },
    json: true,
  };
  const results = await axios.post(
    "https://api.redoxengine.com/endpoint",
    body,
    config
  );
  return results.data;
};

export const postFHIR = async (
  resource: string,
  sandboxSlug: string,
  access_token: string,
  requestParams: RequestParams
) => {

  const body: any = qs.stringify(toFHIR(requestParams));

  const config = {
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
      Authorization: `Bearer ${access_token}`,
      "redox-source-id": process.env.REDOX_DEV_SOURCE_ID
    },
    json: true,
  };
  const results = await axios.post(
    `https://api.redoxengine.com/fhir/R4/${sandboxSlug}/Development/${resource}/_search`,
    body,
    config
  );
  return results.data;
};

export const getAdminAccessToken = async (clientId) => {
  // (A) Generate JWT and sign it
  const sign_request = {
    iss: clientId,
    sub: clientId,
    aud: "https://api.redoxengine.com/v2/auth/token",
    iat: Math.floor(new Date().getTime() / 1000),
    exp: Math.floor(new Date().getTime() / 1000) + 300,
    jti: crypto.randomBytes(8).toString("hex"), //random string nonce
  };
  const signed_jwt = jwt.sign(
    sign_request,
    process.env.REDOX_ADMIN_PRIVATE_KEY,
    {
      algorithm: "RS384",
      header: { kid: process.env.REDOX_ADMIN_KEY_ID },
    }
  );

  // (B) Send signed JWT to Redox for an access_token
  const body = qs.stringify({
    grant_type: "client_credentials",
    client_assertion_type:
      "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
    client_assertion: signed_jwt,
  });
  const config = {
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
  };
  const results = await axios.post(
    "https://api.redoxengine.com/v2/auth/token",
    body,
    config
  );
  return results.data.access_token;
};

export const getSourceAuthv2 = async (sourceAPIKey: string) => {
  // (A) Generate JWT and sign it
  const sign_request = {
    iss: sourceAPIKey,
    sub: sourceAPIKey,
    aud: "https://api.redoxengine.com/oauth/token",
    iat: Math.floor(new Date().getTime() / 1000),
    exp: Math.floor(new Date().getTime() / 1000) + 300,
    jti: crypto.randomBytes(8).toString("hex"), //random string nonce
  };
  const signed_jwt = jwt.sign(
    sign_request,
    process.env.REDOX_ADMIN_PRIVATE_KEY,
    {
      algorithm: "RS384",
      header: { kid: process.env.REDOX_ADMIN_KEY_ID },
    }
  );

  // (B) Send signed JWT to Redox for an access_token
  const body = qs.stringify({
    grant_type: "client_credentials",
    client_assertion_type:
      "urn:ietf:params:oauth:client-assertion-type:jwt-bearer",
    client_assertion: signed_jwt,
  });
  const config = {
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
  };
  const results = await axios.post(
    "https://api.redoxengine.com/oauth/token",
    body,
    config
  );
  return results.data.access_token;
};

export const getSubscriptions = async () => {
  const access_token = await getAdminAccessToken(process.env.REDOX_ADMIN_CLIENT_ID);

  const results = await axios.get(
    `https://api.redoxengine.com/platform/v0/organizations/${process.env.REDOX_ORG_ID}/subscriptions`,
    {
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${access_token}`,
      },
    }
  );

  return { response: results.data, error: "" };
};

export const getDestinations = async () => {
  const { response, error } = await getSubscriptions();

  let uniq = new Set();
  let destinations = response.payload.subscriptions
    //.filter(sub => sub.dele)
    .filter(
      (sub) =>
        sub.source.id === process.env.REDOX_SOURCE_ID ||
        (sub.source.id === process.env.REDOX_DEV_SOURCE_ID &&
          sub.dataModel.startsWith("FHIR."))
    )
    .map((sub) => {
      return { dataModel: sub.dataModel, ...sub.destination };
    })
    .filter((d) => {
      const uniqVal = !uniq.has(d.id);
      uniq.add(d.id);
      return uniqVal;
    });

  return destinations;
};
