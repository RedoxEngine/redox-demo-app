import { RequestParams } from '.'

export const patientSearch = (requestParams: RequestParams) => {
    const dm = {
        Meta: {
            "DataModel": "PatientSearch",
            "EventType": "Query",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": requestParams.destinationid,
                }
            ],
            // "FacilityCode": requestParams.organization,
            "Extensions": {
                "sender-organization-id": {
                    "string": "2.16.840.1.113883.3.6147.458.8731.2.1"
                },
                "user-id": {
                    "string": "Doolittle, John"
                },
                "user-role": {
                    "coding": {
                        "code": "112247003",
                        "display": "Medical Doctor"
                    }
                },
                "purpose-of-use": {
                    "coding": {
                        "code": "TREATMENT"
                    }
                }
            }
        },
        Patient: {
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
            }
        }
    }

    return dm;
}