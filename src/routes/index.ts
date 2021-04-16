import * as express from "express";
import { fromFHIR, patientSearch } from "./redox/patientSearch";
import { postFHIR, postToRedox } from "./redox";
import { patientCreate } from "./redox/patientCreate";
import { getClinicalSummary } from "./redox/getPatientClinicalSummary";
import {
  getAccessToken,
  getAdminAccessToken,
  getDestinations,
  getSourceAuthv2,
} from "./redox";
import xmlFormatter from "xml-formatter";

export const register = (app: express.Application) => {
  app.use(async (req, res, next) => {
    let {
      access_token,
      admin_access_token,
      destinations,
      dev_token,
    } = req.session;
    try {
      if (!access_token) {
        req.session.access_token = await getSourceAuthv2(
          process.env.REDOX_API_KEY
        );
      }
      if (!dev_token) {
        req.session.dev_token = await getAdminAccessToken(
          process.env.ORG_CLIENT_ID
        );
      }
      if (!admin_access_token) {
        req.session.admin_access_token = await getAdminAccessToken(
          process.env.REDOX_ADMIN_CLIENT_ID
        );
      }
      if (!destinations) {
        req.session.destinations = await getDestinations();
      }
    } catch (err) {
      console.error("error setting session vars", err);
      next();
    }
    next();
  });

  app.get("/", (req, res) => {
    res.render("index");
  });

  app.get("/workflows", (req, res) => {
    res.render("index");
  });

  app.get("/patient", async (req, res) => {
    res.render("patient", {
      destinations: req.session.destinations,
      search: {},
      results: {},
      errorMessage: "",
    });
  });
  app.post("/patient", async (req, res) => {
    let results, errorMessage;

    const { destinationid } = req.body;
    const destination = req.session.destinations.find(
      (dest) => dest.id === destinationid
    );

    try {
      if (destination && destination.dataModel.startsWith("FHIR.")) {
        results = await postFHIR(
          "Patient",
          "redox-fhir-sandbox",
          req.session.dev_token,
          req.body
        );
        results = fromFHIR(results);
      } else {
        results = await postToRedox(
          "patientSearch",
          req.session.access_token,
          req.body
        );
        if (results && results.Patient) {
          results.Patients = [results.Patient];
        }
      }
    } catch (e) {
      errorMessage = handleError(e);
      console.error(errorMessage);
    }

    res.render("patient", {
      destinations: req.session.destinations,
      search: req.body,
      results,
      errorMessage,
    });
  });

  app.get("/patient-create", (req, res) => {
    res.redirect("../patient");
  });
  app.post("/patient-create", async (req, res) => {
    let results, errorMessage;
    try {
      results = await postToRedox(
        "patientCreate",
        req.session.access_token,
        req.body
      );
      if (results && results.Patient) {
        results.Patients = [results.Patient];
      }
    } catch (e) {
      errorMessage = handleError(e);
    }

    res.render("patient", {
      destinations: req.session.destinations,
      search: req.body,
      results,
      errorMessage,
    });
  });

  app.get("/clinicalsummary/:destinationid/:patientid", async (req, res) => {
    let results, errorMessage;

    try {
      results = await postToRedox(
        "getClinicalSummary",
        req.session.access_token,
        {
          destinationid: req.params.destinationid,
          patientid: req.params.patientid,
        }
      );
      results = xmlFormatter(results.Data);
    } catch (e) {
      errorMessage = handleError(e);
    }

    res.render("clinicalsummary", { xml: results, errorMessage });
  });

  app.get("/subscriptions", async (req, res) => {
    const results = await getDestinations();
    res.send(results);
  });
};

const handleError = (err: any) => {
  let errorMessage;
  console.error(err.response?.data);
  if (err.response?.data?.resourceType === "OperationOutcome") {
    errorMessage = err.response?.data?.issue[0].details.text;
  } else if (err.response?.data?.Meta?.Errors?.[0]?.Text) {
    errorMessage = err.response.data.Meta.Errors[0].Text;
  } else {
    errorMessage = err.message;
  }

  return errorMessage;
};
