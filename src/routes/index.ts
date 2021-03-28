import * as express from "express";
import { patientSearch } from './redox/patientSearch';
import { patientCreate } from './redox/patientCreate';
import { getClinicalSummary } from './redox/getPatientClinicalSummary';


export const register = (app: express.Application) => {
    // define a route handler for the default home page
    app.get("/", (req: any, res) => {
        res.render("index");
    });

    app.get("/workflows", (req, res) => {
        res.render("index");
    });

    app.get("/patient-search", (req, res) => {
        res.render("patient", { search: {}, results: {}, errorMessage: '' });
    });
    app.post('/patient-search', async (req, res) => {
        let results, errorMessage = '';
        try {
            results = await patientSearch(req.body);
        } catch (e) {
            errorMessage = e.message
            console.log(e);
        }
        res.render('patient', {
            search: req.body,
            results,
            errorMessage
        });
    });

    app.get("/patient-create", (req, res) => {
        res.render("patient", { search: {}, results: {}, errorMessage: '' });
    });
    app.post('/patient-create', async (req, res) => {
        let results, errorMessage = '';
        try {
            results = await patientCreate(req.body);
        } catch (e) {
            errorMessage = e.message
            console.log(e);
        }
        res.render('patient', {
            search: req.body,
            results,
            errorMessage
        });
    });

    app.get('/clinicalsummary/:destinationid/:patientid', async (req, res) => {
        let results, errorMessage = '';
        try {
            results = await getClinicalSummary(req.params.destinationid, req.params.patientid);
        } catch (e) {
            errorMessage = e.message
            console.log(e);
        }
        res.render("clinicalsummary", { xml: results, errorMessage: '' });
    });
};
