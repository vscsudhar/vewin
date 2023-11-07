// To parse this JSON data, do
//
//     final monthlySaleResponse = monthlySaleResponseFromJson(jsonString);

import 'dart:convert';

MonthlySaleResponse monthlySaleResponseFromJson(String str) =>
    MonthlySaleResponse.fromJson(json.decode(str));

String monthlySaleResponseToJson(MonthlySaleResponse data) =>
    json.encode(data.toJson());

class MonthlySaleResponse {
  List<AppSalesList>? appSalesList;
  List<Totalsale>? totalsale;
  int? statusCode;
  String? statusMessage;

  MonthlySaleResponse({
    this.appSalesList,
    this.totalsale,
    this.statusCode,
    this.statusMessage,
  });

  factory MonthlySaleResponse.fromJson(Map<String, dynamic> json) =>
      MonthlySaleResponse(
        appSalesList: json["appSalesList"] == null
            ? []
            : List<AppSalesList>.from(
                json["appSalesList"]!.map((x) => AppSalesList.fromJson(x))),
        totalsale: json["totalsale"] == null
            ? []
            : List<Totalsale>.from(
                json["totalsale"]!.map((x) => Totalsale.fromJson(x))),
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "appSalesList": appSalesList == null
            ? []
            : List<dynamic>.from(appSalesList!.map((x) => x.toJson())),
        "totalsale": totalsale == null
            ? []
            : List<dynamic>.from(totalsale!.map((x) => x.toJson())),
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}

class AppSalesList {
  String? appName;
  int? sales;

  AppSalesList({
    this.appName,
    this.sales,
  });

  factory AppSalesList.fromJson(Map<String, dynamic> json) => AppSalesList(
        appName: json["appName"],
        sales: json["sales"],
      );

  Map<String, dynamic> toJson() => {
        "appName": appName,
        "sales": sales,
      };
}

class Totalsale {
  int? totalSale;

  Totalsale({
    this.totalSale,
  });

  factory Totalsale.fromJson(Map<String, dynamic> json) => Totalsale(
        totalSale: json["totalSale"],
      );

  Map<String, dynamic> toJson() => {
        "totalSale": totalSale,
      };
}

// To parse this JSON data, do
//
//     final monthlySaleRequest = monthlySaleRequestFromJson(jsonString);

// import 'dart:convert';

MonthlySaleRequest monthlySaleRequestFromJson(String str) =>
    MonthlySaleRequest.fromJson(json.decode(str));

String monthlySaleRequestToJson(MonthlySaleRequest data) =>
    json.encode(data.toJson());

class MonthlySaleRequest {
  int? id;
  DateTime? fromDate;
  DateTime? toDate;

  MonthlySaleRequest({
    this.id,
    this.fromDate,
    this.toDate,
  });

  factory MonthlySaleRequest.fromJson(Map<String, dynamic> json) =>
      MonthlySaleRequest(
        id: json["id"],
        fromDate:
            json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fromDate": fromDate?.toIso8601String(),
        "toDate": toDate?.toIso8601String(),
      };
}
