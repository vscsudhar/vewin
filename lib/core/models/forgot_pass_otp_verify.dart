// To parse this JSON data, do
//
//     final forgotPasswordVerifyResponse = forgotPasswordVerifyResponseFromJson(jsonString);

import 'dart:convert';

ForgotPasswordVerifyResponse forgotPasswordVerifyResponseFromJson(String str) =>
    ForgotPasswordVerifyResponse.fromJson(json.decode(str));

String forgotPasswordVerifyResponseToJson(ForgotPasswordVerifyResponse data) =>
    json.encode(data.toJson());

class ForgotPasswordVerifyResponse {
  int? statusCode;
  String? statusMessage;

  ForgotPasswordVerifyResponse({
    this.statusCode,
    this.statusMessage,
  });

  factory ForgotPasswordVerifyResponse.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordVerifyResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}
