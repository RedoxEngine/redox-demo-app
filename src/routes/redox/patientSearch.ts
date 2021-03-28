import { PatientParams, postToRedox } from '.'

export const patientSearch = async (searchParams: PatientParams) => {

    const dm = {
        Meta: {
            "DataModel": "PatientSearch",
            "EventType": "Query",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": searchParams.destinationId,
                }
            ],
            // "FacilityCode": searchParams.organization,
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
                "FirstName": searchParams.firstName,
                "LastName": searchParams.lastName,
                "DOB": searchParams.dob,
                "Sex": searchParams.gender,
                "EmailAddresses": [searchParams.email],
                "Address": {
                    "StreetAddress": searchParams.address,
                    "City": searchParams.city,
                    "State": searchParams.state,
                    "ZIP": searchParams.zip
                }
            }
        }
    }
    const results = await postToRedox(dm);
    if (results && results.Patient) {
        results.Patients = [results.Patient];
    }
    return results;
}