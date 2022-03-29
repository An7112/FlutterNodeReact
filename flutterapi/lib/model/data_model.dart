import 'dart:convert';

List<Data> dataFromJson(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataToJson(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  Data({
    required this.sender,
    required this.title,
    required this.messeage,
    required this.send_to,
  });

  String sender;
  String title;
  String messeage;
  String send_to;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        sender: json["sender"],
        title: json["title"],
        messeage: json["messeage"],
        send_to: json["send_to"],
      );

  Map<String, dynamic> toJson() => {
        "sender": sender,
        "title": title,
        "messeage": messeage,
        "send_to": send_to,
      };
}
