import sessionRepository from "./../repositiries/sessionsRepository.js";
import usersRepository from "../repositiries/usersRepository.js";

export async function checkToken(req, res, next){
    const {authorization} = req.headers;
    const token = authorization?.replace("Bearer ", "");

    if(!token){
        return res.status(401).send("You are not authenticated");
    }

    try{
        const {rows:sessions} = await sessionRepository.getSession(token);
        const [session] = sessions;
        if(!session) {
            return res.status(401).send("You are not authenticated");
        }

        const {rows:users} = await usersRepository.getUser(session.userId);
        const [user] = users;
        if (!user) {
            return res.status(401).send("You are not authenticated");
        }
        
        res.locals.user = user;
        next();
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}