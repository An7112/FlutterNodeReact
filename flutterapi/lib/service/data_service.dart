import 'dart:convert';
import 'package:flutterapi/model/data_model.dart';
import 'package:http/http.dart' as http;

// import 'package:dio/dio.dart';
class DataService {
  String url = "http://172.20.10.4:60444/notifications";
  late List<Data> data;
  List insideData = [];

  Future<List<Data>> getData() async {
    var resp = await http.get(Uri.parse(url));
    insideData = jsonDecode(resp.body);
    data = dataFromJson(resp.body);
    return data;
  }
}
