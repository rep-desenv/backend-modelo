const express = require('express')
const cors = require('cors')

const app = express()
app.use(express.json())
app.use(cors())


app.use('/',
    require('./route/user')
)

app.listen(process.env.PORT, ()=>{
    console.log(`Escutando na porta ${process.env.PORT}...`)
})