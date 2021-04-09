import * as express from "express";
import { patientSearch } from './redox/patientSearch';
import { postToRedox } from './redox';
import { patientCreate } from './redox/patientCreate';
import { getClinicalSummary } from './redox/getPatientClinicalSummary';
import { getAccessToken, getAdminAccessToken, getDestinations } from "./redox";
import xmlFormatter from 'xml-formatter';

export const register = (app: express.Application) => {
    app.use(async (req, res, next) => {
        let { access_token, admin_access_token, destinations } = req.session;

        if (!access_token) {
            req.session.access_token = await getAccessToken();
        }
        if (!admin_access_token) {
            req.session.admin_access_token = await getAdminAccessToken();
        }
        if (!destinations) {
            req.session.destinations = await getDestinations();
        }
        next();
    })

    app.get("/", (req, res) => {
        res.render("index");
    });

    app.get("/workflows", (req, res) => {
        res.render("index");
    });

    app.get("/patient", async (req, res) => {
        res.render("patient", { destinations: req.session.destinations, search: {}, results: {}, errorMessage: '' });
    });
    app.post('/patient', async (req, res) => {
        let results, errorMessage;

        try {
            results = await postToRedox('patientSearch', req.session.access_token, req.body);
            if (results && results.Patient) {
                results.Patients = [results.Patient];
            }
        } catch (e) {
            errorMessage = handleError(e);
        }

        res.render('patient', {
            destinations: req.session.destinations,
            search: req.body,
            results,
            errorMessage
        });
    });

    app.get("/patient-create", (req, res) => {
        res.redirect('../patient')
    });
    app.post('/patient-create', async (req, res) => {
        let results, errorMessage;
        try {
            results = await postToRedox('patientCreate', req.session.access_token, req.body);
            if (results && results.Patient) {
                results.Patients = [results.Patient];
            }
        } catch (e) {
            errorMessage = handleError(e);
        }

        res.render('patient', {
            destinations: req.session.destinations,
            search: req.body,
            results,
            errorMessage
        });
    });

    app.get('/clinicalsummary/:destinationid/:patientid', async (req, res) => {
        let results, errorMessage;

        try {
            results = await postToRedox('getClinicalSummary', req.session.access_token, { destinationid: req.params.destinationid, patientid: req.params.patientid });
            results = xmlFormatter(results.Data);

        } catch (e) {
            errorMessage = handleError(e);
        }

        res.render("clinicalsummary", { xml: results, errorMessage });
    });

    app.get('/subscriptions', async (req, res) => {
        const results = await getDestinations();
        res.send(results);
    })
};

const handleError = (err: any) => {
    let errorMessage;

    if (err.response?.data?.Meta?.Errors?.[0]?.Text) {
        errorMessage = err.response.data.Meta.Errors[0].Text;
    } else {
        errorMessage = err.message;
    }

    return errorMessage;
}
