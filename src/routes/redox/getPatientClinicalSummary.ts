import { RequestParams } from '.'

export const getClinicalSummary = (requestParams: RequestParams) => {

    const dm = {
        Meta: {
            "DataModel": "Clinical Summary",
            "EventType": "DocumentGet",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": requestParams.destinationid

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
        Document: {
            "ID": requestParams.patientid
        }
    }

    return dm;
}

