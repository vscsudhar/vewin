// To parse this JSON data, do
//
//     final profileImageUpdateRequest = profileImageUpdateRequestFromJson(jsonString);


// To parse this JSON data, do
//
//     final profileImageUpdateResponse = profileImageUpdateResponseFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

// ProfileImageUpdateResponse profileImageUpdateResponseFromJson(String str) => ProfileImageUpdateResponse.fromJson(json.decode(str));

// String profileImageUpdateResponseToJson(ProfileImageUpdateResponse data) => json.encode(data.toJson());

// class ProfileImageUpdateResponse {
//     int? statusCode;
//     String? statusMessage;

//     ProfileImageUpdateResponse({
//         this.statusCode,
//         this.statusMessage,
//     });

//     factory ProfileImageUpdateResponse.fromJson(Map<String, dynamic> json) => ProfileImageUpdateResponse(
//         statusCode: json["statusCode"],
//         statusMessage: json["statusMessage"],
//     );

//     Map<String, dynamic> toJson() => {
//         "statusCode": statusCode,
//         "statusMessage": statusMessage,
//     };
// }

// import 'dart:convert';

ProfileImageUpdateRequest profileImageUpdateRequestFromJson(String str) => ProfileImageUpdateRequest.fromJson(json.decode(str));

String profileImageUpdateRequestToJson(ProfileImageUpdateRequest data) => json.encode(data.toJson());

class ProfileImageUpdateRequest {
    int? id;
    String? image;

    ProfileImageUpdateRequest({
        this.id,
        this.image,
    });

    factory ProfileImageUpdateRequest.fromJson(Map<String, dynamic> json) => ProfileImageUpdateRequest(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}
