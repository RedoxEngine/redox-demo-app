import { PatientParams, postToRedox } from '.'
import xmlFormatter from 'xml-formatter';

export const ccdView = async (destinationid: string, patientid: string) => {
    destinationid = destinationid === 'aebb3691-ef33-4bc0-ba84-e0a90b1dffb2' ?
        '9652c03c-6e29-4bac-a4cc-1b003d2ab962' : destinationid;

    const dm = {
        Meta: {
            "DataModel": "Clinical Summary",
            "EventType": "DocumentGet",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    // "ID": 'ec745338-8849-43ad-a7ce-4bc5bf1d8b89',
                    "ID": destinationid

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
            "ID": patientid
        }
    }

    try {
        const results = await postToRedox(dm);
        return xmlFormatter(results.Data);
        // return { Data: xmlFormatter(ccd) };
    } catch {
        return {};
    }
}

