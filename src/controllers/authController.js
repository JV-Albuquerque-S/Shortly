import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

import authRepository from "../repositiries/authRepository.js";
import usersRepository from "../repositiries/usersRepository.js";
import sessionRepository from "../repositiries/sessionsRepository.js";

export async function singUp(req, res){
    const user = req.body;
    const {name, email, password} = req.body;

    try{
        const alreadyExist = usersRepository.checkEmail(user.email);
        if(alreadyExist.rowCount<=0){
            await authRepository.singUp(name, email, password);
            res.sendStatus(201);
        }
        else{
            res.sendStatus(409);
        }
    }
    catch(e){
        console.log(e);
        res.sendStatus(500);
    }
}

export async function singIn(req, res){
    const {email, password} = req.body;
    const {rows: users} = await usersRepository.checkEmail(email);
    const [user] = users;
    if(!user){
        res.sendStatus(401);
    }
    else if(bcrypt.compareSync(password, user.password)) {
        const token = uuid();
        await sessionRepository.newSession(token, user.id);
        res.send(token);
    }

    else{
        res.sendStatus(401);
    }
}