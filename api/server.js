const express = require('express');
const app = express();
const bodyParser = require('body-parser');
const PORT = 60444;
const cors = require('cors');
const mongoose = require('mongoose');
const config = require('./DB.js');
const notificationsRoute = require('./notification.route');
const documentsRoute = require('./document.route');
const studentsRoute = require('./student.route');
mongoose.Promise = global.Promise;
mongoose.connect(config.DB, { useNewUrlParser: true }).then(
    () => {console.log('Database is connected') },
    err => { console.log('Can not connect to the database'+ err)}
);

app.use(cors());

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.use('/notifications', notificationsRoute);
app.use('/documents', documentsRoute);
app.use('/students', studentsRoute);
app.listen(PORT, function(){
    console.log('Server is running on Port:',PORT);
});