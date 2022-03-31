import 'package:flutter/material.dart';
import 'package:flutterapi/model/data_model_student.dart';
import 'package:flutterapi/page/detailPageStudent.dart';
import 'package:flutterapi/service/data_service_student.dart';
// import 'mydrawerheader.dart';

class StudentPage extends StatefulWidget {
  @override
  _StudentPageState createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  DataServiceStudent dataServiceStudent = DataServiceStudent();
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
          future: dataServiceStudent.getDataStudent(),
          builder: (_, snapshot) {
            List<DataStudent>? data = snapshot.data as List<DataStudent>?;
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

  Widget buildListView(List<DataStudent> data, BuildContext context) {
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
                        builder: (_) => DetailPageStudent(
                              Name: data[index].Name,
                              Uid: data[index].Uid,
                              City: data[index].City,
                              ZipCode: data[index].ZipCode,
                              PhoneNumber: data[index].PhoneNumber,
                              ClassA: data[index].ClassA,
                              CitizenID: data[index].CitizenID,
                            )));
              },
              leading: Icon(Icons.amp_stories_outlined),
              title: Text(
                '${data[index].Name}',
              ),
              subtitle: Text('${data[index].Uid}'),
              trailing: Text('${data[index].ClassA}'),
            ),
          ),
        );
      },
    );
  }
}
