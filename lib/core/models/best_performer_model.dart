// To parse this JSON data, do
//
//     final bestPerformerResponse = bestPerformerResponseFromJson(jsonString);

import 'dart:convert';

List<BestPerformerResponse> bestPerformerResponseFromJson(String str) =>
    List<BestPerformerResponse>.from(
        json.decode(str).map((x) => BestPerformerResponse.fromJson(x)));

String bestPerformerResponseToJson(List<BestPerformerResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BestPerformerResponse {
  String? name;
  int? sales;
  dynamic photo;
  String? remarks;

  BestPerformerResponse({
    this.name,
    this.sales,
    this.photo,
    this.remarks,
  });

  factory BestPerformerResponse.fromJson(Map<String, dynamic> json) =>
      BestPerformerResponse(
        name: json["name"],
        sales: json["sales"],
        photo: json["photo"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "sales": sales,
        "photo": photo,
        "remarks": remarks,
      };
}
