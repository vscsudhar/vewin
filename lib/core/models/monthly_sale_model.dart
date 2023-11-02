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

  MonthlySaleResponse({
    this.appSalesList,
    this.totalsale,
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
      );

  Map<String, dynamic> toJson() => {
        "appSalesList": appSalesList == null
            ? []
            : List<dynamic>.from(appSalesList!.map((x) => x.toJson())),
        "totalsale": totalsale == null
            ? []
            : List<dynamic>.from(totalsale!.map((x) => x.toJson())),
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
