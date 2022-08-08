import { Router } from "express";

import { getUrl, openUrl, urlShortener } from "../controllers/urlsController.js";

import {schemaValidator} from "./../schemas/schemaValidator.js";
import urlSchema from "./../schemas/urlsSchema.js";
import { checkToken } from "../middlewares/authMiddleware.js";



const urlsRouter = Router();

urlsRouter.get("/urls/:id", getUrl);
urlsRouter.get("/urls/open/:shortUrl", openUrl);
urlsRouter.post("/urls/shorten", schemaValidator(urlSchema), checkToken, urlShortener);

export default urlsRouter;