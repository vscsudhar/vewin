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
// To parse this JSON data, do
//
//     final verifiedOtpRequest = verifiedOtpRequestFromJson(jsonString);

VerifiedOtpRequest verifiedOtpRequestFromJson(String str) =>
    VerifiedOtpRequest.fromJson(json.decode(str));

String verifiedOtpRequestToJson(VerifiedOtpRequest data) =>
    json.encode(data.toJson());

class VerifiedOtpRequest {
  String? mobile;
  String? otp;
  String? modifiedby;
  DateTime? modifiedon;

  VerifiedOtpRequest({
    this.mobile,
    this.otp,
    this.modifiedby,
    this.modifiedon,
  });

  factory VerifiedOtpRequest.fromJson(Map<String, dynamic> json) =>
      VerifiedOtpRequest(
        mobile: json["mobile"],
        otp: json["otp"],
        modifiedby: json["modifiedby"],
        modifiedon: json["modifiedon"] == null
            ? null
            : DateTime.parse(json["modifiedon"]),
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "otp": otp,
        "modifiedby": modifiedby,
        "modifiedon": modifiedon?.toIso8601String(),
      };
}
