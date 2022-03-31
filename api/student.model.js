const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define collection and schema for Business
let Students = new Schema({
    Name:{
        type: String,
    },
    Uid:{
        type: String
    },
    City:{
        type: String,
    },
    ZipCode:{
        type: String,
    },
    PhoneNumber:{
        type: String,
    },
    ClassA:{
        type: String,
    },
    CitizenID:{
        type:String
    }
}, {
    collection: 'students'
});

module.exports = mongoose.model('Students', Students);