import 'package:flutter/material.dart';
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
  String appname = 'Flutter Api';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              leading: Icon(Icons.amp_stories_outlined),
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
