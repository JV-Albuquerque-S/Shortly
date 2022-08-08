import Joi from "joi";

const urlSchema = Joi.string().required();

export default urlSchema;