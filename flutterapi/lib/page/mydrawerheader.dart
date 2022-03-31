import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff003333),
      width: double.infinity,
      height: 180,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              // shape: BoxShape.circle,
              // image: DecorationImage(
              //   image: AssetImage('assets/image/bgr.png'),
              // ),
            ),
          ),
          Text(
            "Nhom 7",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text("Nguyễn Thành An",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )),
        ],
      ),
    );
  }
}
