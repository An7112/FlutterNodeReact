const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Define collection and schema for Business
let Notifications = new Schema({
    sender: {
        type: String
    },
    title: {
        type: String
    },
    messeage: {
        type: String
    },
    send_to: {
        type: String
    },

}, {
    collection: 'notifications'
});

module.exports = mongoose.model('Notifications', Notifications);
