const quizRoute = require('../controller/quiz')



const express = require('express');





const router = express.Router();


router.route('/postquiz').post(quizRoute.createquiz)
router.route('/').get(quizRoute.getquiz)
router.route('/edit/:quizid').put(quizRoute.editQuizz)
router.route('/edit/:quizid').delete(quizRoute.deleteQuizz)









module.exports = router;



