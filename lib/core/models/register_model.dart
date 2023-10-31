// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  String? message;
  String? otp;
  String? type;
  String? title;
  int? status;
  String? traceId;
  Errors? errors;

  RegisterResponse({
    this.message,
    this.otp,
    this.type,
    this.title,
    this.status,
    this.traceId,
    this.errors,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        message: json["message"],
        otp: json["otp"],
        type: json["type"],
        title: json["title"],
        status: json["status"],
        traceId: json["traceId"],
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "otp": otp,
        "type": type,
        "title": title,
        "status": status,
        "traceId": traceId,
        "errors": errors?.toJson(),
      };
}

class Errors {
  List<String>? user;
  List<String>? id;

  Errors({
    this.user,
    this.id,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        user: json["user"] == null
            ? []
            : List<String>.from(json["user"]!.map((x) => x)),
        id: json["\u0024.id"] == null
            ? []
            : List<String>.from(json["\u0024.id"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user": user == null ? [] : List<dynamic>.from(user!.map((x) => x)),
        "\u0024.id": id == null ? [] : List<dynamic>.from(id!.map((x) => x)),
      };
}

// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

// import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  int? id;
  String? name;
  String? mobile;
  String? email;
  String? address;
  String? pincode;
  String? password;
  String? status;
  String? vcode;
  String? usertype;
  String? createdby;
  DateTime? createdon;
  String? modifiedby;
  DateTime? modifiedon;
  String? isdeleted;

  RegisterRequest({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.address,
    this.pincode,
    this.password,
    this.status,
    this.vcode,
    this.usertype,
    this.createdby,
    this.createdon,
    this.modifiedby,
    this.modifiedon,
    this.isdeleted,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        email: json["email"],
        address: json["address"],
        pincode: json["pincode"],
        password: json["password"],
        status: json["status"],
        vcode: json["vcode"],
        usertype: json["usertype"],
        createdby: json["createdby"],
        createdon: json["createdon"] == null
            ? null
            : DateTime.parse(json["createdon"]),
        modifiedby: json["modifiedby"],
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
        isdeleted: json["isdeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "email": email,
        "address": address,
        "pincode": pincode,
        "password": password,
        "status": status,
        "vcode": vcode,
        "usertype": usertype,
        "createdby": createdby,
        "createdon": createdon?.toIso8601String(),
        "modifiedby": modifiedby,
        "modifiedon": modifiedon?.toIso8601String(),
        "isdeleted": isdeleted,
      };
}
