import 'package:flutter/material.dart';
import 'package:flutterapi/page/student.dart';
import 'notification.dart';
import 'document.dart';
import 'mydrawerheader.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Theme(
        //trong suoots
        data: Theme.of(context).copyWith(
          // Set the transparency here
          canvasColor: Colors
              .transparent, //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Drawer(
            child: Container(
              // color: Colors.transparent,
              child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(width: 1.0, color: Colors.white),
                    ),
                  ),
                  child: Column(
                    children: [
                      MyHeaderDrawer(),
                      MyDrawerList(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("Đại Học Đông Á"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              height: 300,
              child: SizedBox(
                height: 100,
                width: 400,
                child: ClipRRect(
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage('images/donga.jpg'),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                height: 100,
                width: 400,
                child: ElevatedButton(
                  child: const Text('Thông Báo'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                height: 100,
                width: 380,
                child: ElevatedButton(
                  child: const Text('Khóa Học'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DocumentPage()),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: SizedBox(
                height: 100,
                width: 380,
                child: ElevatedButton(
                  child: const Text('Thông tin sinh viên'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudentPage()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      //     ],
      //   ),
      // ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.black.withOpacity(0.4),
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          ThongBao(),
          KhoaHoc(),
          ThongTinSinhVien(),
        ],
      ),
    );
  }

  Widget ThongBao() {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotificationPage(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.account_balance,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Thông Báo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Lato',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget KhoaHoc() {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DocumentPage(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.bookmark_add_outlined,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Khóa học",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Lato',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget ThongTinSinhVien() {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StudentPage(),
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  Icons.wrap_text,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  "Thông tin sinh viên",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Lato',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
