const express = require('express')
const cors =  require('cors')
const annonceRoutes = require('./routes/annonceroutes')
const quizRoute = require('./routes/quizroutes')

const connectDb = require('./config/db')



const app = express()



app.use(express.json({extended: false}))

require("dotenv").config();




app.use(cors())

connectDb()


app.use('/annonce', annonceRoutes)
app.use('/quiz', quizRoute)


const PORT = process.env.PORT || 3000;


app.listen(PORT, console.log("i am running"))


