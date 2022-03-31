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
  String pagename = 'Thông báo';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(pagename),
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

  Widget buildAppBar() {
    return AppBar(
      title: Text(pagename),
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
