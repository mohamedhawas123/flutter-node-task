const asyncHandler = require('express-async-handler')
const QuizzModel = require('../models/quizz');



const createquiz = asyncHandler(async(req, res)=> {

    const {course, topic ,unite } = req.body;

    try{

        let quizz = new QuizzModel(
           {
            course: course,
            topic:topic,
            unite: unite, 
           }
        )
        const createdquiz = await quizz.save()
        res.status(201).json(createdquiz)

    }catch(e) {
        console.log(e)
    }


})


const getquiz = asyncHandler(async(req, res) => {
    try {
        let quizz = await QuizzModel.find({})
        res.json(quizz)
    }catch(e) {
        console.log(e)
    }
    

})



const editQuizz = asyncHandler(async(req, res)=> {

    const {name, quiz, answer} = req.body;

    const quizz = await QuizzModel.findById(req.params.quizid)
    if(quizz){


        quizz.name = name,
        quizz.quiz = quiz,
        quizz.answer = answer


        const updatedquiz = await quizz.save()
        res.json(updatedquiz)
        

    }else {
        res.json({'message': 'Not Found'})

    }


})

const deleteQuizz = asyncHandler(async(req, res)=> {


    const quizz = await AnnoncementModels.findById(req.params.annonceid)
    if(quizz){

        await quizz.remove();
        res.json({'message': 'quiz has been removed'})

    }else {
        res.status(404)

        res.json({'message': 'Not Found'})

    }


})



 
module.exports = {createquiz, getquiz, editQuizz, deleteQuizz}