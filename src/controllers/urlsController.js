import { nanoid } from "nanoid";

import urlsRepository from "../repositiries/urlsRepository.js";

export async function getUrl(req, res){
    const {id} = req.params;

    try{
        const url = await urlsRepository.getUrl(id);
        if(!url.rows[0]){
            res.sendStatus(404);
        }
        else{
            delete url.visitCount;
            delete url.userId;

            res.send(url).status(200);
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
        const url = await urlsRepository.getShortUrl(shortUrl);
        if(!url.rows[0]){
            res.sendStatus(404);
        }
        else{
            await urlsRepository.updateVisits(url.id);
            res.redirect(url.url);
        }
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}