const asyncHandler = require('express-async-handler')
const AnnoncementModels = require('../models/annocement');



const createannonce = asyncHandler(async(req, res)=> {

    const {name, annonce, imageUrl} = req.body;

    try{

        let annoncee = new AnnoncementModels(
           {
            name: name,
            annonce: annonce, 
            imageUrl: imageUrl
           }
        )
        const createdannonce = await annoncee.save()
        res.status(201).json(createdannonce)

    }catch(e) {
        console.log(e)
    }


})


const getannonce = asyncHandler(async(req, res) => {
    try {
        let annonce = await AnnoncementModels.find({})
        res.json(annonce)
    }catch(e) {
        console.log(e)
    }
    

})


const editAnnonce = asyncHandler(async(req, res)=> {

    const {name, annonce} = req.body;

    const annoncec = await AnnoncementModels.findById(req.params.annonceid)
    if(annoncec){


        annoncec.name = name,
        annoncec.annonce = annonce
        const updatedannonce = await annoncec.save()
        res.json(updatedannonce)

    }else {
        res.json({'message': 'Not Found'})

    }


})

const deleteAnnonce = asyncHandler(async(req, res)=> {


    const annoncec = await AnnoncementModels.findById(req.params.annonceid)
    if(annoncec){

        await annoncec.remove();
        res.json({'message': 'quiz has been removed'})

    }else {
        res.status(404)

        res.json({'message': 'Not Found'})

    }


})





 
module.exports = {createannonce, getannonce, editAnnonce,deleteAnnonce }