// To parse this JSON data, do
//
//     final updatePasswordRequest = updatePasswordRequestFromJson(jsonString);

import 'dart:convert';

UpdatePasswordRequest updatePasswordRequestFromJson(String str) =>
    UpdatePasswordRequest.fromJson(json.decode(str));

String updatePasswordRequestToJson(UpdatePasswordRequest data) =>
    json.encode(data.toJson());

class UpdatePasswordRequest {
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
  String? photo;

  UpdatePasswordRequest({
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
    this.photo,
  });

  factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordRequest(
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
        photo: json["photo"],
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
        "photo": photo,
      };
}

UpdatePasswordResponse updatePasswordResponseFromJson(String str) =>
    UpdatePasswordResponse.fromJson(json.decode(str));

String updatePasswordResponseToJson(UpdatePasswordResponse data) =>
    json.encode(data.toJson());

class UpdatePasswordResponse {
  int? statusCode;
  String? statusMessage;

  UpdatePasswordResponse({
    this.statusCode,
    this.statusMessage,
  });

  factory UpdatePasswordResponse.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}
