import axios from 'axios';

var REDOX_API_KEY = process.env.API_KEY;
var REDOX_API_SECRET = process.env.API_SECRET;
var REDOX_AUTH_URL = 'https://api.redoxengine.com/auth/authenticate';
var REDOX_API_URL = 'https://api.redoxengine.com/endpoint';

export interface PatientParams {
    firstName: string;
    lastName: string;
    dob: string;
    gender: string;
    email: string;
    address: string;
    city: string;
    zip: string;
    state: string;
    patientid: string;
    destinationId: string;
    docid: string;
}

export const getAccessToken = async () => {
    const authConfig = {
        url: REDOX_AUTH_URL,
        headers: {
            'Content-Type': 'application/json'
        },
        json: true
    }
    const auth_response = await axios.post(REDOX_AUTH_URL, {
        apiKey: REDOX_API_KEY,
        secret: REDOX_API_SECRET,
    }, authConfig);
    const access_token = auth_response.data.accessToken;

    return access_token;
}

export const postToRedox = async (body: any) => {
    const access_token = await getAccessToken();

    const config = {
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${access_token}`
        },
        json: true
    }
    const results = await axios.post(REDOX_API_URL, body, config)
    return results.data;
}

export const ccdSearch = async (searchParams: PatientParams) => {

    const dm = {
        Meta: {
            "DataModel": "Clinical Summary",
            "EventType": "DocumentQuery",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    // "ID": 'ec745338-8849-43ad-a7ce-4bc5bf1d8b89',
                    "ID": searchParams.destinationId
                }
            ],
            // "FacilityCode": searchParams.destinationId,
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
            "Identifiers": [{
                "ID": searchParams.patientid,
                "IDType": searchParams.destinationId
            }
            ]
        }
    }

    const results = await postToRedox(dm);
    return results;
}



