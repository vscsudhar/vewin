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
// To parse this JSON data, do
//
//     final getSalesDetailsRequest = getSalesDetailsRequestFromJson(jsonString);

// import 'dart:convert';

GetSalesDetailsRequest getSalesDetailsRequestFromJson(String str) =>
    GetSalesDetailsRequest.fromJson(json.decode(str));

String getSalesDetailsRequestToJson(GetSalesDetailsRequest data) =>
    json.encode(data.toJson());

class GetSalesDetailsRequest {
  int? id;
  String? appName;
  DateTime? fromDate;
  DateTime? toDate;

  GetSalesDetailsRequest({
    this.id,
    this.appName,
    this.fromDate,
    this.toDate,
  });

  factory GetSalesDetailsRequest.fromJson(Map<String, dynamic> json) =>
      GetSalesDetailsRequest(
        id: json["id"],
        appName: json["appName"],
        fromDate:
            json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "appName": appName,
        "fromDate": fromDate?.toIso8601String(),
        "toDate": toDate?.toIso8601String(),
      };
}
