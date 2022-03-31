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
  String pagename = 'Thông tin';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pagename),
          centerTitle: true,
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
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(children: [
                Center(
                  child: Icon(
                    Icons.person,
                    size: 20,
                  ),
                ),
                buildText(text: '${widget.Name}'),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  // height: 800,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(),
                        buildText(text: 'ID sinh viên:  ${widget.Uid}'),
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(),
                        buildText(text: 'Quê quán:  ${widget.City}'),
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(),
                        buildText(text: 'Zip Code:  ${widget.ZipCode}'),
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(),
                        buildText(
                            text: 'Số điện thoại:  ${widget.PhoneNumber}'),
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(),
                        buildText(text: 'Lớp:  ${widget.ClassA}'),
                      ]),
                ),
                SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(),
                        buildText(
                            text: 'Căn cước công dân: ${widget.CitizenID}'),
                      ]),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildText({String? text}) {
    return Card(
      child: Text(
        text!,
        style: TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}
