// To parse this JSON data, do
//
//     final forgotPasswordRequest = forgotPasswordRequestFromJson(jsonString);

import 'dart:convert';

ForgotPasswordRequest forgotPasswordRequestFromJson(String str) =>
    ForgotPasswordRequest.fromJson(json.decode(str));

String forgotPasswordRequestToJson(ForgotPasswordRequest data) =>
    json.encode(data.toJson());

class ForgotPasswordRequest {
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

  ForgotPasswordRequest({
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

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequest(
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

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) =>
    ForgotPasswordResponse.fromJson(json.decode(str));

String forgotPasswordResponseToJson(ForgotPasswordResponse data) =>
    json.encode(data.toJson());

class ForgotPasswordResponse {
  int? statusCode;
  String? otp;

  ForgotPasswordResponse({
    this.statusCode,
    this.otp,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponse(
        statusCode: json["statusCode"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "otp": otp,
      };
}
