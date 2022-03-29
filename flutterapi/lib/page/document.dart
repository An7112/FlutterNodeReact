import 'package:flutter/material.dart';
import 'package:flutterapi/model/data_model.dart';
import 'package:flutterapi/model/data_model_document.dart';
import 'package:flutterapi/page/detailPageDocument.dart';
import 'package:flutterapi/service/data_service_document.dart';
import 'mydrawerheader.dart';

class DocumentPage extends StatefulWidget {
  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  DataServiceDocument dataServiceDocument = DataServiceDocument();
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
          future: dataServiceDocument.getDataDocument(),
          builder: (_, snapshot) {
            List<DataDocument>? data = snapshot.data as List<DataDocument>?;
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

  Widget buildListView(List<DataDocument> data, BuildContext context) {
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
                        builder: (_) => DetailPageDocument(
                              Subject: data[index].Subject,
                              SubjectTitle: data[index].SubjectTitle,
                              Detail: data[index].Detail,
                              Lecturers: data[index].Lecturers,
                            )));
              },
              leading: Icon(Icons.local_fire_department_sharp),
              title: Text('${data[index].Subject} '),
              subtitle: Text('${data[index].SubjectTitle}'),
              trailing: Text('${data[index].Lecturers}'),
            ),
          ),
        );
      },
    );
  }
}
