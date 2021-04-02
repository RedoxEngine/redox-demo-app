import express from "express";
import path from "path";
import * as routes from "./routes";
import session from 'express-session';
require('dotenv').config()
declare module 'express-session' {
    export interface SessionData {
        destinations: { [key: string]: any };
        access_token: string;
        admin_access_token: string;
    }
}

const app = express(); 
const port = process.env.PORT || 3000;

app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));
app.use(express.static(path.join(__dirname, 'public')));
app.use(session({ secret: 'whoa-a-red-ox', cookie: { maxAge: 60 * 60 * 1000 } }))

// Configure Express to use EJS
app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");

routes.register(app);

// start the express server
app.listen(port, () => {
    // tslint:disable-next-line:no-console
    console.log(`server started`);
});