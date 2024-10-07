// src/middleware/validationMiddleware.ts
import { Request, Response, NextFunction } from 'express';
import { StatusCodes } from 'http-status-codes';

export function validateData() {
  return (req: Request, res: Response, next: NextFunction) => {
    try {
        console.log('Validação realizada.....')
        //se for OK
        next();
        //Se for indeferida
        //res.status(StatusCodes.BAD_REQUEST).json({ error: 'Invalid data' });
    } catch (error) {      
        res.status(StatusCodes.BAD_REQUEST).json({ error: 'Invalid data' });      
    }
  };
}