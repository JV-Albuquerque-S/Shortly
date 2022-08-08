import { Router } from "express";

import { getRank } from "../controllers/usersController.js";

const userRouter = Router();

userRouter.get("/ranking", getRank);

export default userRouter;