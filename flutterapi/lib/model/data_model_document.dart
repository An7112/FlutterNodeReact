import 'dart:convert';

List<DataDocument> dataFromJsonDocument(String str) => List<DataDocument>.from(
    json.decode(str).map((x) => DataDocument.fromJson(x)));

String dataToJson(List<DataDocument> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataDocument {
  DataDocument({
    required this.Subject,
    required this.SubjectTitle,
    required this.Detail,
    required this.Lecturers,
  });

  String Subject;
  String SubjectTitle;
  String Detail;
  String Lecturers;

  factory DataDocument.fromJson(Map<String, dynamic> json) => DataDocument(
        Subject: json["Subject"],
        SubjectTitle: json["SubjectTitle"],
        Detail: json["Detail"],
        Lecturers: json["Lecturers"],
      );

  Map<String, dynamic> toJson() => {
        "Subject": Subject,
        "SubjectTitle": SubjectTitle,
        "Detail": Detail,
        "Lecturers": Lecturers,
      };
}
