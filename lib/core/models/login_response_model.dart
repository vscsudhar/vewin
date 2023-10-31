// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    String? token;
    Dashboard? dashboard;

    LoginResponse({
        this.token,
        this.dashboard,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        token: json["token"],
        dashboard: json["dashboard"] == null ? null : Dashboard.fromJson(json["dashboard"]),
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "dashboard": dashboard?.toJson(),
    };
}

class Dashboard {
    int? id;
    dynamic photo;
    String? mobile;
    String? name;
    dynamic designation;
    String? userType;

    Dashboard({
        this.id,
        this.photo,
        this.mobile,
        this.name,
        this.designation,
        this.userType,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        id: json["id"],
        photo: json["photo"],
        mobile: json["mobile"],
        name: json["name"],
        designation: json["designation"],
        userType: json["userType"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "mobile": mobile,
        "name": name,
        "designation": designation,
        "userType": userType,
    };
}
