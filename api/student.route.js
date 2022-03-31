const express = require('express');
const studentRoutes = express.Router();
let Student = require('./student.model');

// Defined store route
studentRoutes.route('/addstudent').post(function (req, res) {
    let student = new Student(req.body);
    student.save()
        .then(student => {
            res.status(200).json({'student': 'student in added successfully'});
        })
        .catch(err => {
            res.status(400).send("unable to save to database");
        });
});
studentRoutes.route('/').get(function (req, res) {
    Student.find(function(err, students){
        if(err){
            console.log(err);
        }
        else {
            res.json(students);
        }
    });
});

// Defined edit route
studentRoutes.route('/edit/:id').get(function (req, res) {
    let id = req.params.id;
    Student.findById(id, function (err, business){
        res.json(business);
    });
});

//  Defined update route
studentRoutes.route('/update/:id').post(function (req, res) {
    Student.findById(req.params.id, function(err, student) {
        if (!student)
            res.status(404).send("data is not found");
        else {
            console.log(student);
            //gửi đến webserver thông tin về các gói HTTP Request
            student.Name = req.body.Name;
            student.Uid = req.body.Uid;
            student.City = req.body.City;
            student.ZipCode = req.body.ZipCode;
            student.PhoneNumber = req.body.PhoneNumber;
            student.ClassA = req.body.ClassA;
            student.CitizenID = req.body.CitizenID;

            student.save().then(business => {
                res.json('Update complete');
            })
                .catch(err => {
                    res.status(400).send("unable to update the database");
                });
        }
    });
});

// Defined delete | remove | destroy route
studentRoutes.route('/delete/:id').get(function (req, res) {
    Student.findByIdAndRemove({_id: req.params.id}, function(err, student){
        if(err) res.json(err);
        else res.json('Successfully removed');
    });
});

module.exports = studentRoutes;