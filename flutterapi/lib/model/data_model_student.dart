import 'dart:convert';

List<DataStudent> dataFromJsonStudent(String str) => List<DataStudent>.from(
    json.decode(str).map((x) => DataStudent.fromJson(x)));

String dataToJson(List<DataStudent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataStudent {
  DataStudent({
    required this.Name,
    required this.Uid,
    required this.City,
    required this.ZipCode,
    required this.PhoneNumber,
    required this.ClassA,
    required this.CitizenID,
  });

  String Name;
  String Uid;
  String City;
  String ZipCode;
  String PhoneNumber;
  String ClassA;
  String CitizenID;

  factory DataStudent.fromJson(Map<String, dynamic> json) => DataStudent(
        Name: json["Name"],
        Uid: json["Uid"],
        City: json["City"],
        ZipCode: json["ZipCode"],
        PhoneNumber: json["PhoneNumber"],
        ClassA: json["ClassA"],
        CitizenID: json["CitizenID"],
      );

  Map<String, dynamic> toJson() => {
        "Name": Name,
        "Uid": Uid,
        "City": City,
        "ZipCode": ZipCode,
        "PhoneNumber": PhoneNumber,
        "ClassA": ClassA,
        "CitizenID": CitizenID,
      };
}
