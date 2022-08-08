import db from "../db.js";

async function newSession(token, id){
    return db.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2)`, [token, id]);
}

async function getSession(token){
    return db.query(`SELECT *  FROM sessions WHERE token = $1`, [token]);
}

const sessionRepository = {
    newSession,
    getSession
}

export default sessionRepository;