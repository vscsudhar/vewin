// To parse this JSON data, do
//
//     final getSalesDetailsResponse = getSalesDetailsResponseFromJson(jsonString);

import 'dart:convert';

List<GetSalesDetailsResponse> getSalesDetailsResponseFromJson(String str) =>
    List<GetSalesDetailsResponse>.from(
        json.decode(str).map((x) => GetSalesDetailsResponse.fromJson(x)));

String getSalesDetailsResponseToJson(List<GetSalesDetailsResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetSalesDetailsResponse {
  String? id;
  String? name;
  String? amount;
  String? date;

  GetSalesDetailsResponse({
    this.id,
    this.name,
    this.amount,
    this.date,
  });

  factory GetSalesDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetSalesDetailsResponse(
        id: json["id"],
        name: json["name"],
        amount: json["amount"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "amount": amount,
        "date": date,
      };
}
