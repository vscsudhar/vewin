// To parse this JSON data, do
//
//     final updatePasswordRequest = updatePasswordRequestFromJson(jsonString);

import 'dart:convert';

UpdatePasswordRequest updatePasswordRequestFromJson(String str) => UpdatePasswordRequest.fromJson(json.decode(str));

String updatePasswordRequestToJson(UpdatePasswordRequest data) => json.encode(data.toJson());

class UpdatePasswordRequest {
    String? mobile;
    String? password;
    String? modifiedby;
    DateTime? modifiedon;

    UpdatePasswordRequest({
        this.mobile,
        this.password,
        this.modifiedby,
        this.modifiedon,
    });

    factory UpdatePasswordRequest.fromJson(Map<String, dynamic> json) => UpdatePasswordRequest(
        mobile: json["mobile"],
        password: json["password"],
        modifiedby: json["modifiedby"],
        modifiedon: json["modifiedon"] == null ? null : DateTime.parse(json["modifiedon"]),
    );

    Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
        "modifiedby": modifiedby,
        "modifiedon": modifiedon?.toIso8601String(),
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
