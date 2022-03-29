import 'package:flutter/material.dart';
import 'package:flutterapi/model/data_model.dart';
import 'package:flutterapi/page/detailPage.dart';
import 'package:flutterapi/service/data_service.dart';
import 'mydrawerheader.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  DataService dataService = DataService();
  String appname = 'Node_Flutter';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          title: Text(appname),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: FutureBuilder(
          future: dataService.getData(),
          builder: (_, snapshot) {
            List<Data>? data = snapshot.data as List<Data>?;
            if (!snapshot.hasData) {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ));
            }
            return buildListView(data!, context);
          },
        ),
      ),
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
          // AboutItem(),
          // SaveItem(),
          // LogoutItem(),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      title: Text(appname),
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Widget buildListView(List<Data> data, BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (_, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => DetailPage(
                              sender: data[index].sender,
                              title: data[index].title,
                              messeage: data[index].messeage,
                              send_to: data[index].send_to,
                            )));
              },
              leading: Icon(Icons.local_fire_department_sharp),
              title: Text('${data[index].sender} '),
              subtitle: Text('${data[index].title}'),
              trailing: Text('${data[index].send_to}'),
            ),
          ),
        );
      },
    );
  }
}
