const mongoose = require('mongoose');



const connectDb = async ()=>{


    try {

        const conn = await mongoose.connect("mongodb+srv://saif:panzer123@cluster0.ueoelzv.mongodb.net/?retryWrites=true&w=majority", {
            useUnifiedTopology: true,
            useNewUrlParser:true,
        })

        console.log(`mongoose is connected ${conn.connection.host}`)


    }catch(e) {
        console.error(`Error: ${e.message}`)
        process.exit(1)
    }

}


module.exports = connectDb