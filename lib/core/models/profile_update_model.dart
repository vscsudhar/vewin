// To parse this JSON data, do
//
//     final profileUpdateResponse = profileUpdateResponseFromJson(jsonString);

import 'dart:convert';

ProfileUpdateResponse profileUpdateResponseFromJson(String str) =>
    ProfileUpdateResponse.fromJson(json.decode(str));

String profileUpdateResponseToJson(ProfileUpdateResponse data) =>
    json.encode(data.toJson());

class ProfileUpdateResponse {
  int? statusCode;
  String? statusMessage;

  ProfileUpdateResponse({
    this.statusCode,
    this.statusMessage,
  });

  factory ProfileUpdateResponse.fromJson(Map<String, dynamic> json) =>
      ProfileUpdateResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}
