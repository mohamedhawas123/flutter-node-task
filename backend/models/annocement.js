const mongoose = require('mongoose');



const AnnoncementModels =mongoose.Schema({


    name: {
        type: 'String',
        required: true,
    },
    annonce: {
        type: 'String',
        required: true,

    },
    createdAT: {
        type: 'Date',
        required: false,

    },
    imageUrl: {
        type: 'String',
        required: false,

    }

}, {
timestamps: true

}
)


const Annoncements = mongoose.model('Annonce', AnnoncementModels)


module.exports  = Annoncements


