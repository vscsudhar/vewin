// To parse this JSON data, do
//
//     final profileImageUpdateResponse = profileImageUpdateResponseFromJson(jsonString);

import 'dart:convert';

List<ProfileImageUpdateResponse> profileImageUpdateResponseFromJson(String str) => List<ProfileImageUpdateResponse>.from(json.decode(str).map((x) => ProfileImageUpdateResponse.fromJson(x)));

String profileImageUpdateResponseToJson(List<ProfileImageUpdateResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileImageUpdateResponse {
    String? profile;

    ProfileImageUpdateResponse({
        this.profile,
    });

    factory ProfileImageUpdateResponse.fromJson(Map<String, dynamic> json) => ProfileImageUpdateResponse(
        profile: json["profile"],
    );

    Map<String, dynamic> toJson() => {
        "profile": profile,
    };
}
