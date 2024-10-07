import { Router } from "express"
import userRouter from "./user-routes"


const route: Router = Router()

route.use(`/api/${process.env.VERSAO}/`, userRouter)
// route.use(`/api/${process.env.VERSAO_DOIS}/`, userRouter)

export default route