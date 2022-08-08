import { Router } from "express";

import urlsRouter from "./urlsRouter.js";
import userRouter from "./usersRouter.js";
import authRouter from "./authRouter.js";

const router = Router();

router.use(urlsRouter);
router.use(userRouter);
router.use(authRouter);

export default router;