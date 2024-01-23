// To parse this JSON data, do
//
//     final forgotPasswordRequest = forgotPasswordRequestFromJson(jsonString);

import 'dart:convert';

ForgotPasswordRequest forgotPasswordRequestFromJson(String str) =>
    ForgotPasswordRequest.fromJson(json.decode(str));

String forgotPasswordRequestToJson(ForgotPasswordRequest data) =>
    json.encode(data.toJson());

class ForgotPasswordRequest {
  String? mobile;
  String? modifiedby;
  DateTime? modifiedon;

  ForgotPasswordRequest({
    this.mobile,
    this.modifiedby,
    this.modifiedon,
  });

  factory ForgotPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordRequest(
        mobile: json["mobile"],
        modifiedby: json["modifiedby"],
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "modifiedby": modifiedby,
        "modifiedon": modifiedon?.toIso8601String(),
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
