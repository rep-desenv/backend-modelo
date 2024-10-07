import { Router } from "express";
import { Request, Response, NextFunction } from "express";
import * as userController from '../controllers/user-controller';
import * as userMiddleware from '../middleware/user-middleware'

const router = Router();


router.get("/users", userMiddleware.validateData(), userController.getUsers),
router.get("/user/:id", userController.getUser)
router.put("/user/:id", userController.updateUser)
router.post("/user", userController.createUser);
router.delete("/user/:id", userController.deleteUser);


export default router;