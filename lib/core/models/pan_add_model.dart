// To parse this JSON data, do
//
//     final panAddResponse = panAddResponseFromJson(jsonString);

import 'dart:convert';

PanNoAddResponse panNoAddResponseFromJson(String str) =>
    PanNoAddResponse.fromJson(json.decode(str));

String panNoAddResponseToJson(PanNoAddResponse data) =>
    json.encode(data.toJson());

class PanNoAddResponse {
  int? statusCode;
  String? statusMessage;

  PanNoAddResponse({
    this.statusCode,
    this.statusMessage,
  });

  factory PanNoAddResponse.fromJson(Map<String, dynamic> json) =>
      PanNoAddResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}

// To parse this JSON data, do
//
//     final panAddRequest = panAddRequestFromJson(jsonString);

PanAddRequest panAddRequestFromJson(String str) =>
    PanAddRequest.fromJson(json.decode(str));

String panAddRequestToJson(PanAddRequest data) => json.encode(data.toJson());

class PanAddRequest {
  int? id;
  String? name;
  String? pan;
  DateTime? dob;
  String? isdeleted;
  String? createdby;
  DateTime? createdon;
  String? modifiedby;
  DateTime? modifiedon;

  PanAddRequest({
    this.id,
    this.name,
    this.pan,
    this.dob,
    this.isdeleted,
    this.createdby,
    this.createdon,
    this.modifiedby,
    this.modifiedon,
  });

  factory PanAddRequest.fromJson(Map<String, dynamic> json) => PanAddRequest(
        id: json["id"],
        name: json["name"],
        pan: json["pan"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        isdeleted: json["isdeleted"],
        createdby: json["createdby"],
        createdon: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        modifiedby: json["modifiedby"],
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "pan": pan,
        "dob": dob?.toIso8601String(),
        "isdeleted": isdeleted,
        "createdby": createdby,
        "createdon": createdon?.toIso8601String(),
        "modifiedby": modifiedby,
        "modifiedon": modifiedon?.toIso8601String(),
      };
}
