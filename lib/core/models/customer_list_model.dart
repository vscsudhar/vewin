// To parse this JSON data, do
//
//     final customerListCountResponse = customerListCountResponseFromJson(jsonString);

import 'dart:convert';

CustomerListCountResponse customerListCountResponseFromJson(String str) =>
    CustomerListCountResponse.fromJson(json.decode(str));

String customerListCountResponseToJson(CustomerListCountResponse data) =>
    json.encode(data.toJson());

class CustomerListCountResponse {
  List<CustomersCount>? customersCount;
  List<Totalcustomer>? totalcustomer;

  CustomerListCountResponse({
    this.customersCount,
    this.totalcustomer,
  });

  factory CustomerListCountResponse.fromJson(Map<String, dynamic> json) =>
      CustomerListCountResponse(
        customersCount: json["customersCount"] == null
            ? []
            : List<CustomersCount>.from(
                json["customersCount"]!.map((x) => CustomersCount.fromJson(x))),
        totalcustomer: json["totalcustomer"] == null
            ? []
            : List<Totalcustomer>.from(
                json["totalcustomer"]!.map((x) => Totalcustomer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "customersCount": customersCount == null
            ? []
            : List<dynamic>.from(customersCount!.map((x) => x.toJson())),
        "totalcustomer": totalcustomer == null
            ? []
            : List<dynamic>.from(totalcustomer!.map((x) => x.toJson())),
      };
}

class CustomersCount {
  String? appName;
  int? count;

  CustomersCount({
    this.appName,
    this.count,
  });

  factory CustomersCount.fromJson(Map<String, dynamic> json) => CustomersCount(
        appName: json["appName"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "appName": appName,
        "count": count,
      };
}

class Totalcustomer {
  int? totalCustomers;

  Totalcustomer({
    this.totalCustomers,
  });

  factory Totalcustomer.fromJson(Map<String, dynamic> json) => Totalcustomer(
        totalCustomers: json["totalCustomers"],
      );

  Map<String, dynamic> toJson() => {
        "totalCustomers": totalCustomers,
      };
}
