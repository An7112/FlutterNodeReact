import 'dart:convert';
import 'package:flutterapi/model/data_model_student.dart';
import 'package:http/http.dart' as http;

class DataServiceStudent {
  String url = "http://172.20.10.4:60444/students";
  late List<DataStudent> data;
  List insideDataStudent = [];

  Future<List<DataStudent>> getDataStudent() async {
    var resp = await http.get(Uri.parse(url));
    insideDataStudent = jsonDecode(resp.body);
    data = dataFromJsonStudent(resp.body);
    return data;
  }
}
