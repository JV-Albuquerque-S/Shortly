import { Router } from "express";

import { getUrl, openUrl } from "../controllers/urlsController.js";

const urlsRouter = Router();

urlsRouter.get("/urls/:id", getUrl);
urlsRouter.get("/urls/open/:shortUrl", openUrl);

export default urlsRouter;