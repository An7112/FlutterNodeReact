import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPageDocument extends StatefulWidget {
  String Subject, SubjectTitle, Detail, Lecturers;

  DetailPageDocument(
      {required this.Subject,
      required this.SubjectTitle,
      required this.Detail,
      required this.Lecturers});
  @override
  _DetailPageDocumentState createState() => _DetailPageDocumentState();
}

class _DetailPageDocumentState extends State<DetailPageDocument> {
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
              height: 250,
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
                    buildText(text: 'Subject : ${widget.Subject}'),
                    buildText(text: 'Subject Title : ${widget.SubjectTitle}'),
                    buildText(text: 'Detail : ' + widget.Detail),
                    buildText(text: 'Lecturers : ' + widget.Lecturers),
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
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
