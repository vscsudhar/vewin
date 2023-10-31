// To parse this JSON data, do
//
//     final verifiedOtpResponse = verifiedOtpResponseFromJson(jsonString);

import 'dart:convert';

VerifiedOtpResponse verifiedOtpResponseFromJson(String str) =>
    VerifiedOtpResponse.fromJson(json.decode(str));

String verifiedOtpResponseToJson(VerifiedOtpResponse data) =>
    json.encode(data.toJson());

class VerifiedOtpResponse {
  int? statusCode;
  String? statusMessage;

  VerifiedOtpResponse({
    this.statusCode,
    this.statusMessage,
  });

  factory VerifiedOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifiedOtpResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}
