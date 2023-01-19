const annonceRoute = require('../controller/annon')



const express = require('express');





const router = express.Router();


router.route('/post').post(annonceRoute.createannonce)
router.route('/').get(annonceRoute.getannonce)
router.route('/edit/:annonceid').put(annonceRoute.editAnnonce)
router.route('/:annonceid/delete').delete(annonceRoute.deleteAnnonce)






module.exports = router;



