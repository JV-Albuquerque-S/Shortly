import db from "../db.js";

async function getUsersRanked(){
    return db.query(`SELECT u.id, u.name, 
    COUNT(ur.id) as "linksCount", 
    CASE WHEN SUM(ur.views) is NULL THEN 0 ELSE SUM(ur.views) END as "visitCount"
    FROM users u LEFT JOIN urls ur ON ur."userId" = u.id
    GROUP BY u.id ORDER BY "visitCount" DESC LIMIT 10`);
}

async function checkEmail(email){
    return db.query(`SELECT * FROM users WHERE email = $1`, [email]);
}

async function getUser(id){
    return db.query(`SELECT * FROM users WHERE id = $1`, [id]);
}

const usersRepository = {
    getUsersRanked,
    checkEmail,
    getUser
}

export default usersRepository;