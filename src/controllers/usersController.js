import usersRepository from "../repositiries/usersRepository.js"

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