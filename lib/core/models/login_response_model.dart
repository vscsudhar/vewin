// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String? token;
    String? status;
    int? statusCode;
    String? statusMessage;
    Dashboard? dashboard;

    LoginResponse({
        this.token,
        this.status,
        this.statusCode,
        this.statusMessage,
        this.dashboard,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        status: json["status"],
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
        dashboard: json["dashboard"] == null ? null : Dashboard.fromJson(json["dashboard"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "status": status,
        "statusCode": statusCode,
        "statusMessage": statusMessage,
        "dashboard": dashboard?.toJson(),
    };
}

class Dashboard {
    int? id;
    String? photo;
    String? mobile;
    String? name;
    String? userType;
    List<Announcement>? announcements;
    List<Banner>? banners;

    Dashboard({
        this.id,
        this.photo,
        this.mobile,
        this.name,
        this.userType,
        this.announcements,
        this.banners,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        id: json["id"],
        photo: json["photo"],
        mobile: json["mobile"],
        name: json["name"],
        userType: json["userType"],
        announcements: json["announcements"] == null ? [] : List<Announcement>.from(json["announcements"]!.map((x) => Announcement.fromJson(x))),
        banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "mobile": mobile,
        "name": name,
        "userType": userType,
        "announcements": announcements == null ? [] : List<dynamic>.from(announcements!.map((x) => x.toJson())),
        "banners": banners == null ? [] : List<dynamic>.from(banners!.map((x) => x.toJson())),
    };
}

class Announcement {
    String? title;
    String? description;

    Announcement({
        this.title,
        this.description,
    });

    factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        title: json["title"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
    };
}

class Banner {
    String? image;

    Banner({
        this.image,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
    };
}


LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  String? mobile;
  String? password;

  LoginRequest({
    this.mobile,
    this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        mobile: json["mobile"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "mobile": mobile,
        "password": password,
      };
}
