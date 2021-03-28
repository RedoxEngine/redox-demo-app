import { PatientParams, postToRedox } from '.'

export const patientCreate = async (searchParams: PatientParams) => {
    const dm = {
        Meta: {
            "DataModel": "PatientAdmin",
            "EventType": "NewPatient",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": searchParams.destinationId
                }
            ]
        },
        Patient: {
            "Identifiers": [{
                "ID": 123,
                "IDType": 123
            }],
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
            },
            "PCP": {
                "NPI": "94599",
                "ID": "94599"
            }

        }
    }

    const results = await postToRedox(dm);
    return results;
}
