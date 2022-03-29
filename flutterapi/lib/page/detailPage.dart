import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  String sender, title, messeage, send_to;

  DetailPage(
      {required this.sender,
      required this.title,
      required this.messeage,
      required this.send_to});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                    buildText(text: 'sender : ${widget.sender}'),
                    buildText(text: 'sender : ${widget.title}'),
                    buildText(text: 'messeage : ' + widget.messeage),
                    buildText(text: 'send_to : ' + widget.send_to),
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
