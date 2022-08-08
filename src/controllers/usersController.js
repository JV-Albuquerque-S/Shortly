import usersRepository from "../repositiries/usersRepository.js"
import urlsRepository from "../repositiries/urlsRepository.js";

export async function getRank(req, res){
    try{
        const rank = await usersRepository.getUsersRanked();
        res.send(rank.rows);
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}

export async function getUser(req, res){
    const { user } = res.locals;
    const { id } = req.params;

    /*if(id !== user.id){
        res.sendStatus(401);
    }*/

    try{
        const findViews = await urlsRepository.getUsersViews(user.id);
        const [views] = findViews.rows;

        const findUrls = await urlsRepository.getUsersUrl(user.id);
        const urls = findUrls.rows;

        res.send({id: user.id, name: user.name, views: views.sum || 0, shortenedUrls: urls});
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}