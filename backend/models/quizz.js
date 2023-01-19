const mongoose = require('mongoose');



const QuizzModelSCa =mongoose.Schema({


    course: {
        type: 'String',
        required: true,
    },
   
   
    
    topic: {
        type: 'String',
        required: true,
    },

    unite: {
        type: 'String',
        required: true,
    },

    from: {
        required: false,
        type:  Date,

    },

    to :{
        required: false,
        type:  Date,
        
    }
    

}, {
timestamps: true

}
)


const QuizzModel = mongoose.model('quiz', QuizzModelSCa)


module.exports  = QuizzModel


 // choices: [

    //     {
    //         title: {
    //             type: 'String',
    //             required: 'true',
                
    //         },

    
    //     }
    // ],