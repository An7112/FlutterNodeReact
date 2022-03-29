import 'dart:convert';
import 'package:flutterapi/model/data_model_document.dart';
import 'package:http/http.dart' as http;

// import 'package:dio/dio.dart';
class DataServiceDocument {
  String url = "http://192.168.10.30:60444/documents";
  late List<DataDocument> data;
  List insideDataDocument = [];

  Future<List<DataDocument>> getDataDocument() async {
    var resp = await http.get(Uri.parse(url));
    insideDataDocument = jsonDecode(resp.body);
    data = dataFromJsonDocument(resp.body);
    return data;
  }
}
