import { RequestParams } from '.'
import { v4 as uuidv4 } from 'uuid';

export const patientCreate = (requestParams: RequestParams) => {
    const dm = {
        Meta: {
            "DataModel": "PatientAdmin",
            "EventType": "NewPatient",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": requestParams.destinationid
                }
            ]
        },
        Patient: {
            "Identifiers": [{
                "ID": uuidv4(),
                "IDType": "Redox Demo App ID"
            }],
            "Demographics": {
                "FirstName": requestParams.firstName,
                "LastName": requestParams.lastName,
                "DOB": requestParams.dob,
                "Sex": requestParams.gender,
                "EmailAddresses": [requestParams.email],
                "Address": {
                    "StreetAddress": requestParams.address,
                    "City": requestParams.city,
                    "State": requestParams.state,
                    "ZIP": requestParams.zip
                }
            },
            "PCP": {
                "NPI": "94599",
                "ID": "94599"
            }

        }
    }

    return dm;
}
