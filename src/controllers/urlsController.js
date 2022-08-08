import { nanoid } from "nanoid";

import urlsRepository from "../repositiries/urlsRepository.js";

export async function getUrl(req, res){
    const {id} = req.params;

    try{
        const bigUrl = await urlsRepository.getUrl(id);
        if(!bigUrl.rows[0]){
            res.sendStatus(404);
        }
        else{
            const [url] = bigUrl.rows;
            delete url.views;
            delete url.userId;
            delete url.createdAt;

            res.status(200).send(url);
        }

    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}

export async function openUrl(req, res){
    const {shortUrl} = req.params;

    try{
        const short = await urlsRepository.getShortUrl(shortUrl);
        if(!short.rowCount){
            res.sendStatus(404);
        }
        else{
            const [url] = short.rows; 
            await urlsRepository.updateVisits(url.id);
            res.redirect(url.url);
        }
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}

export async function urlShortener(req, res){
    const {user} = res.locals;
    const {url} = req.body;

    const shortUrl = nanoid(8);

    try{
        await urlsRepository.postUrl(url, shortUrl, user.id);
        res.status(201).send({shortUrl});
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}