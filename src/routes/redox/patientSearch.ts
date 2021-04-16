import { response } from "express";
import { RequestParams } from ".";

export const patientSearch = (requestParams: RequestParams) => {
  const dm = {
    Meta: {
      DataModel: "PatientSearch",
      EventType: "Query",
      EventDateTime: new Date().toISOString(),
      Test: true,
      Destinations: [
        {
          ID: requestParams.destinationid,
        },
      ],
      // "FacilityCode": requestParams.organization,
      Extensions: {
        "sender-organization-id": {
          string: "2.16.840.1.113883.3.6147.458.8731.2.1",
        },
        "user-id": {
          string: "Doolittle, John",
        },
        "user-role": {
          coding: {
            code: "112247003",
            display: "Medical Doctor",
          },
        },
        "purpose-of-use": {
          coding: {
            code: "TREATMENT",
          },
        },
      },
    },
    Patient: {
      Demographics: {
        FirstName: requestParams.firstName,
        LastName: requestParams.lastName,
        DOB: requestParams.dob,
        Sex: requestParams.gender,
        EmailAddresses: [requestParams.email],
        Address: {
          StreetAddress: requestParams.address,
          City: requestParams.city,
          State: requestParams.state,
          ZIP: requestParams.zip,
        },
      },
    },
  };

  return dm;
};
export const toFHIR = (requestParams: RequestParams) => {
  return {
    given: requestParams.firstName,
    family: requestParams.lastName,
    birthdate: requestParams.dob,
    "address-city": requestParams.city,
    "address-state": requestParams.state,
    "address-postalcode": requestParams.zip,
    email: requestParams.email,
  };
};

export const fromFHIR = (bundle: any) => {
  return {
    Patients: bundle.entry.map(({resource}) => {
        console.log(resource)
      return {
        Identifiers: [{
            ID: resource.identifier[0].value
        }],
        Demographics: {
          FirstName: resource.name[0].given,
          LastName: resource.name[0].family,
          DOB: resource.birthDate,
          Sex: resource.gender,
          Address: {
            StreetAddress: resource.address[0].line.join('\n')
          },
          PhoneNumber: {
              Home: resource.telecom[0].value
          }
        },

      };
    }),
  };
};
