import db from "../db.js";

async function getUrl(id){
    return db.query(`SELECT * FROM urls WHERE id = $1`, [id]);
}

async function getShortUrl(url){
    return db.query(`SELECT * FROM urls WHERE "shortUrl" = $1`, [url]);
}

async function updateVisits(id){
    return db.query(`UPDATE urls SET views = views + 1 WHERE id = $1`, [id]);
}

async function postUrl(url, shortUrl, id){
    return db.query(`INSERT INTO urls (url, "shortUrl", "userId") VALUES ($1, $2, $3)`, [url, shortUrl, id]);
}

async function deleteUrl(id){
    return db.query(`DELETE FROM urls WHERE urls.id = $1`, [id]);
}

async function getUsersViews(userId){
    return db.query(`SELECT SUM(u.views) FROM urls u WHERE u."userId" = $1`, [userId]);
}

async function getUsersUrl(userId){
    return db.query(`SELECT * FROM urls WHERE urls."userId" = $1`, [userId])
}

const urlsRepository = {
    getUrl,
    getShortUrl,
    updateVisits,
    postUrl,
    deleteUrl,
    getUsersViews,
    getUsersUrl
}

export default urlsRepository;