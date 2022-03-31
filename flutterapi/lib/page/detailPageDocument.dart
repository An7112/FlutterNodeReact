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
  String pagename = 'Chi tiết khóa học';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pagename),
          leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
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
                        Icons.book_outlined,
                        size: 20,
                      ),
                    ),
                    buildText(text: '${widget.Subject}'),
                    SizedBox(height: 5),
                    buildText(text: '${widget.SubjectTitle}'),
                    SizedBox(height: 40),
                    buildText(
                        text: '${widget.SubjectTitle}: ' +
                            '' +
                            '${widget.Detail}'),
                    SizedBox(height: 10),
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
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
