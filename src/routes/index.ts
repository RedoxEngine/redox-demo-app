import * as express from "express";
import { patientSearch, patientCreate, ccdSearch, ccdView } from './redox';

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
    app.get("/ccd", (req, res) => {
        res.render("ccd", { search: {}, results: {}, errorMessage: '' });
    });
    app.post('/ccd', async (req, res) => {
        let results, errorMessage = '';
        try {
            results = await ccdSearch(req.body);
        } catch (e) {
            errorMessage = e.message
            console.log(e);
        }
        res.render('ccd', {
            search: req.body,
            results,
            errorMessage
        });
    });
    app.get("/ccd-view", (req, res) => {
        res.render("ccd-view", { search: {}, results: {}, errorMessage: '' });
    });
    app.post('/ccd-view', async (req, res) => {
        let results, errorMessage = '';
        try {
            results = await ccdView(req.body);
        } catch (e) {
            errorMessage = e.message
            console.log(e);
        }
        res.render('ccd-view', {
            search: req.body,
            results,
            errorMessage
        });
    });
};
