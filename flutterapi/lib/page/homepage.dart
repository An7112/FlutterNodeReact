import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> lists = [
    "Thời khóa biểu",
    "Thông báo",
    "Tài liệu",
    "Giáo trình"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: lists.map((list) {
                        return box(list, Colors.grey);
                      }).toList(),
                    )),
              ],
            )));
  }

  Widget box(String title, Color backgroundcolor) {
    return Container(
        margin: EdgeInsets.all(10),
        width: 380,
        color: backgroundcolor,
        alignment: Alignment.center,
        child:
            Text(title, style: TextStyle(color: Colors.white, fontSize: 20)));
  }
}
