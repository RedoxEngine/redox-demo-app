import axios from 'axios';

var REDOX_API_KEY = '4fee8c55-66b6-4bd4-a719-7b78775351c4'; 
var REDOX_API_SECRET = 'KXpJMCGsh8nJiVLTUpL0NF9Hm337aYkfjFE7RYAMUjb2bU8IIAcg53iSmKDlNtm0IAnyPy6g'; 
var REDOX_AUTH_URL = 'https://api.redoxengine.com/auth/authenticate';
var REDOX_API_URL = 'https://api.redoxengine.com/endpoint';

const destinationId = '1ca254a8-8d42-4593-abb4-b21399d9de57';

interface RequestParams {
    firstName: string;
    lastName: string;
    dob: string;
    gender: string;
    email: string;
    address: string;
    city: string;
    zip: string;
    state: string;
    apiKey: string;
    apiSecret: string;
    patientid: string;
    organization: string;
    docid: string;
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
            "FacilityCode": searchParams.organization,
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
                    "City" : searchParams.city,
                    "State": searchParams.state,
                    "ZIP": searchParams.zip
                }
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
                "EmailAddresses": [searchParams.email],
                "Address": {
                    "StreetAddress": searchParams.address,
                    "City" : searchParams.city,
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

    const results = await postToRedox(searchParams, dm);
    return results;
}

export const ccdSearch = async (searchParams: RequestParams) => {

    const dm = {
        Meta: {
            "DataModel": "Clinical Summary",
            "EventType": "DocumentQuery",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": 'ec745338-8849-43ad-a7ce-4bc5bf1d8b89',
                }
            ],
            "FacilityCode": searchParams.organization,
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
                "IDType": searchParams.organization
            }
            ]
            }
        }
    
    const results = await postToRedox(searchParams, dm);
    return results;
}

export const ccdView = async (searchParams: RequestParams) => {

    const dm = {
        Meta: {
            "DataModel": "Clinical Summary",
            "EventType": "DocumentGet",
            "EventDateTime": new Date().toISOString(),
            "Test": true,
            "Destinations": [
                {
                    "ID": 'ec745338-8849-43ad-a7ce-4bc5bf1d8b89',
                }
            ],
            "FacilityCode": searchParams.organization,
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
                "ID": searchParams.docid
            }
        }
    
    const results = await postToRedox(searchParams, dm);
    return results;
}

