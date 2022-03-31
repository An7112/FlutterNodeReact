import 'dart:convert';
import 'package:flutterapi/model/data_model_document.dart';
import 'package:http/http.dart' as http;

class DataServiceDocument {
  String url = "http://172.20.10.4:60444/documents";
  late List<DataDocument> data;
  List insideDataDocument = [];

  Future<List<DataDocument>> getDataDocument() async {
    var resp = await http.get(Uri.parse(url));
    insideDataDocument = jsonDecode(resp.body);
    data = dataFromJsonDocument(resp.body);
    return data;
  }
}
