import axios from 'axios';

var REDOX_API_KEY = process.env.API_KEY; 
var REDOX_API_SECRET = process.env.API_SECRET; 
var REDOX_AUTH_URL = 'https://api.redoxengine.com/auth/authenticate';
var REDOX_API_URL = 'https://api.redoxengine.com/endpoint';

const destinationId = 'aebb3691-ef33-4bc0-ba84-e0a90b1dffb2';

interface RequestParams {
    firstName: string;
    lastName: string;
    dob: string;
    gender: string;
    apiKey: string;
    apiSecret: string;
}

export const getAccessToken = async (params: RequestParams) => {
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

export const postToRedox = async (params: RequestParams, body: any) => {
    const access_token = await getAccessToken(params);

    const config = {
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${access_token}`
        },
        json: true
    }
    const results = await axios.post(REDOX_API_URL, body, config)
    console.log(results.data);
    return results.data;
}

export const patientSearch = async (searchParams: RequestParams) => {

    const dm = {
        Meta: {
            "DataModel": "PatientSearch",
            "EventType": "Query",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": destinationId,
                }
            ],

            // TODO: Carequality 
            // "FacilityCode": "2.16.840.1.113883.3.651",
            // "Extensions": {
            //     "sender-organization-id": {
            //         "string": "urn:oid:{{Your base OID here}}.{{facility number}}"
            //     },
            //     "user-id": {
            //         "string": "Doolittle, John"
            //     },
            //     "user-role": {
            //         "coding": {
            //             "code": "112247003",
            //             "display": "Medical Doctor"
            //         }
            //     }
            // }
        },
        Patient: {
            "Demographics": {
                "FirstName": searchParams.firstName,
                "LastName": searchParams.lastName,
                "DOB": searchParams.dob,
                "Sex": searchParams.gender
            }
        }
    }
    const results = await postToRedox(searchParams, dm);
    return results;
}

export const patientCreate =async (searchParams: RequestParams) => {
    const dm = {
        Meta: {
            "DataModel": "PatientAdmin",
            "EventType": "NewPatient",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": destinationId,
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
                "Address": {
                    "State": "WI",
                    "ZIP": 12345
                }
            },
            "PCP": {
                "NPI": "94599",
                "ID": "94599"
            }

        }
    }

    const results = await postToRedox(searchParams, dm);
    return results;
}