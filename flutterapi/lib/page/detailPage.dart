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
  String pagename = 'Chi tiết thông báo';
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
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Icon(
                        Icons.access_alarm,
                        size: 20,
                      ),
                    ),
                    buildText(text: 'Người gửi : ${widget.sender}'),
                    buildText(text: ' ${widget.title}'),
                    buildText(text: 'Nội dung : ' + widget.messeage),
                    buildText(text: 'Gửi đến : ' + widget.send_to),
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
