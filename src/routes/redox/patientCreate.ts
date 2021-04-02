import { RequestParams, postToRedox } from '.'

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
                "ID": 123,
                "IDType": 123
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
