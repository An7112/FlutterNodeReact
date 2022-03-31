import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPageStudent extends StatefulWidget {
  String Name, Uid, City, ZipCode, PhoneNumber, ClassA, CitizenID;

  DetailPageStudent({
    required this.Name,
    required this.Uid,
    required this.City,
    required this.ZipCode,
    required this.PhoneNumber,
    required this.ClassA,
    required this.CitizenID,
  });
  @override
  _DetailPageStudentState createState() => _DetailPageStudentState();
}

class _DetailPageStudentState extends State<DetailPageStudent> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Card(
            elevation: 10.0,
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              alignment: Alignment.center,
              // height: 800,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    buildText(text: '${widget.Name}'),
                    SizedBox(height: 5),
                    buildText(text: '${widget.Uid}'),
                    SizedBox(height: 40),
                    buildText(text: '${widget.Uid}: ' + '' + '${widget.City}'),
                    SizedBox(height: 10),
                    buildText(text: 'Zip Code : ' + widget.ZipCode),
                    buildText(text: '${widget.PhoneNumber}'),
                    buildText(text: '${widget.ClassA}'),
                    buildText(text: '${widget.CitizenID}'),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildText({String? text}) {
    return Center(
      child: Text(
        text!,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
