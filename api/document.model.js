const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define collection and schema for Business
let Documents = new Schema({
    Subject: {
        type: String
    },
    SubjectTitle: {
        type: String
    },
    Detail: {
        type: String
    },
    Lecturers: {
        type: String
    }
}, {
    collection: 'documents'
});

module.exports = mongoose.model('Documents', Documents);