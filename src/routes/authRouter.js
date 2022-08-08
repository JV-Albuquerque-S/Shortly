import { Router } from "express";

import singUpSchema from "../schemas/singUpSchema.js";
import singInSchema from "../schemas/singInSchema.js";

import { singUp } from "../controllers/authController.js";
import { singIn } from "../controllers/authController.js";

import { schemaValidator } from "../schemas/schemaValidator.js";

const authRouter = Router();

authRouter.post("/singup", schemaValidator(singUpSchema), singUp);
authRouter.post("/singin", schemaValidator(singInSchema), singIn);

export default authRouter;