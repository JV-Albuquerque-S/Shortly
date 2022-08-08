import dotenv from "dotenv";
import chalk from "chalk";

import app from "./app.js";

dotenv.config();

const port = process.env.PORT || 4000;
app.listen(port, () => {
    console.log(chalk.bold.green(`Servidor em pé na porta ${port}`));
});