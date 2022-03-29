const express = require('express');
const documentRoutes = express.Router();

// Require Business model in our routes module
let Document = require('./document.model');

// Defined store route
documentRoutes.route('/addDocument').post(function (req, res) {
    let document = new Document(req.body);
    document.save()
        .then(document => {
            res.status(200).json({'document': 'document in added successfully'});
        })
        .catch(err => {
            res.status(400).send("unable to save to database");
        });
});

// Defined get data(index or listing) route
documentRoutes.route('/').get(function (req, res) {
    Document.find(function(err, documents){
        if(err){
            console.log(err);
        }
        else {
            res.json(documents);
        }
    });
});

// Defined edit route
documentRoutes.route('/editDocument/:id').get(function (req, res) {
    let id = req.params.id;
    Document.findById(id, function (err, business){
        res.json(business);
    });
});

//  Defined update route
documentRoutes.route('/updateDocument/:id').post(function (req, res) {
    Document.findById(req.params.id, function(err, document) {
        if (!document)
            res.status(404).send("data is not found");
        else {
            console.log(document);
            document.Subject = req.body.Subject; //gửi đến webserver thông tin về các gói HTTP Request
            document.SubjectTitle = req.body.SubjectTitle;
            document.Detail = req.body.Detail;
            document.Lecturers = req.body.Lecturers;

            document.save().then(business => {
                res.json('Update complete');
            })
                .catch(err => {
                    res.status(400).send("unable to update the database");
                });
        }
    });
});

// Defined delete | remove | destroy route
documentRoutes.route('/deleteDocument/:id').get(function (req, res) {
    Document.findByIdAndRemove({_id: req.params.id}, function(err, document){
        if(err) res.json(err);
        else res.json('Successfully removed');
    });
});

module.exports = documentRoutes;