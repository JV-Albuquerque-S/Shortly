import db from "../db.js";

async function getUsersRanked(){
    return db.query(`SELECT u.id, u.name, 
    COUNT(ur.id) as "linksCount", 
    SUM(ur.views) as "visitCount"
    FROM urls ur JOIN users u ON ur."userId" = u.id
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