import { Router } from "express";

import { getRank, getUser } from "../controllers/usersController.js";
import { checkToken } from "../middlewares/authMiddleware.js";

const userRouter = Router();

userRouter.get("/ranking", getRank);
userRouter.get("/users/me", checkToken, getUser);

export default userRouter;