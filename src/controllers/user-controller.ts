import { StatusCodes } from 'http-status-codes';
import { Prisma, User } from '@prisma/client';
import express, { Request, Response, NextFunction } from "express";
import * as userService from './../service/user-service';
import { json } from "body-parser"


// export async function getUsers( req: Request, res:Response, next:NextFunction){
//     try {  

//       const users = await userService.getUsers();
//       res.status(200).json(users)        
    
//     } catch (e) {
    
//       console.log('Erro inesperado => ', e)

//       if (typeof e === "string") {
//         res.status(500).json({
//           message: "Erro inesperado => " + e.toUpperCase()}) // works, `e` narrowed to string
//       } else if (e instanceof Error) {
//         res.status(500).json({
//           message: "Erro tratado => " + e.message  })// works, `e` narrowed to Error
//       }
      
//       next(e)
    
//     }
// }

export async function getUsers( req: Request, res:Response, next:NextFunction){
  
    await userService.getUsers().then((users)=>{
      res.status(200).json(users)  
    }).catch ((e) => {  
      res.status(e.statusCode).json({message: e.message})
      next(e)  
    })
}

export async function getUser( req: Request, res:Response, next:NextFunction){  
      const user = await userService.getUser(Number(req.params.id)).then((retorno)=>{
        
        console.log('Retorno: ', retorno)
        res.status(200).json(retorno)  
      
      }).catch ((e)=>{
      
        console.log(e)

        res.status(e.statusCode).json({message: e.message})

        // console.log('Erro inesperado => ', e)
  
        // if (typeof e === "string") {
        //   res.status(500).json({
        //     message: "Erro inesperado => " + e.toUpperCase()}) // works, `e` narrowed to string
        // } else if (e instanceof Error) {
        //   res.status(500).json({
        //     message: "Erro tratado => " + e.message  })// works, `e` narrowed to Error
        // }

        next(e)
      
      })        
}

export async function createUser(req: Request, res:Response, next:NextFunction){
    const insert = await userService.createUser( req.body).then((retorno)=>{
    
      console.log('Retorno: ', retorno)
      res.status(201).json(retorno)   
    
    }).catch ((e)=>{
      
      console.log(e)

      res.status(e.statusCode).json({message: e.message})

      // if (typeof e === "string") {
      //   res.status(500).json({
      //     message: "Erro inesperado => " + e.toUpperCase()}) // works, `e` narrowed to string
      // } else if (e instanceof Error) {
      //   res.status(500).json({
      //     message: "Erro tratado => " + e.message  })// works, `e` narrowed to Error
      // }

      next(e)
    
    }) 
}


export async function updateUser(req: Request, res:Response, next:NextFunction){
  const insert = await userService.updateUser( Number(req.params.id), req.body).then((retorno)=>{
    
    console.log('Retorno: ', retorno)
    res.status(200).json(retorno)   
  
  }).catch ((e)=>{

    console.log(e)

    res.status(e.statusCode).json({message: e.message})
  
    // console.log('Erro inesperado => ', e)

    // if (typeof e === "string") {
    //   res.status(500).json({
    //     message: "Erro inesperado => " + e.toUpperCase()}) // works, `e` narrowed to string
    // } else if (e instanceof Error) {
    //   res.status(500).json({
    //     message: "Erro tratado => " + e.message  })// works, `e` narrowed to Error
    // }

    next(e)
  
  })
}

export async function deleteUser( req: Request, res:Response, next:NextFunction){  
  const user = await userService.deleteUser(Number(req.params.id)).then((retorno)=>{
    
    console.log('Retorno: ', retorno)
    res.status(204).json(retorno)  
  
  }).catch ((e)=>{

    console.log(e)

    res.status(e.statusCode).json({message: e.message})
  
    // console.log('Erro inesperado => ', e)

    // if (typeof e === "string") {
    //   res.status(500).json({
    //     message: "Erro inesperado => " + e.toUpperCase()}) // works, `e` narrowed to string
    // } else if (e instanceof Error) {
    //   res.status(500).json({
    //     message: "Erro tratado => " + e.message  })// works, `e` narrowed to Error
    // }

    next(e)
  
    })        
}