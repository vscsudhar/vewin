// To parse this JSON data, do
//
//     final customerListDetailsResponse = customerListDetailsResponseFromJson(jsonString);

import 'dart:convert';

List<CustomerListDetailsResponse> customerListDetailsResponseFromJson(
        String str) =>
    List<CustomerListDetailsResponse>.from(
        json.decode(str).map((x) => CustomerListDetailsResponse.fromJson(x)));

String customerListDetailsResponseToJson(
        List<CustomerListDetailsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomerListDetailsResponse {
  String? name;
  String? area;

  CustomerListDetailsResponse({
    this.name,
    this.area,
  });

  factory CustomerListDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CustomerListDetailsResponse(
        name: json["name"],
        area: json["area"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "area": area,
      };
}
