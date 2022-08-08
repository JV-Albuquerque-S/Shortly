import bcrypt from "bcrypt";

import db from "./../db.js";

async function singUp(name, email, password){
    const crypted = bcrypt.hashSync(password, 10/*process.env.KEY*/);
    return db.query(`INSERT INTO users (name, email, password) VALUES ($1, $2, $3)`, [name, email, crypted]);
}

const authRepository = {
    singUp
}

export default authRepository;