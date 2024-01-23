// To parse this JSON data, do
//
//     final paymentListResponse = paymentListResponseFromJson(jsonString);

import 'dart:convert';

List<PaymentListResponse> paymentListResponseFromJson(String str) => List<PaymentListResponse>.from(json.decode(str).map((x) => PaymentListResponse.fromJson(x)));

String paymentListResponseToJson(List<PaymentListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PaymentListResponse {
    int? id;
    int? cid;
    String? month;
    String? salesAmount;
    DateTime? dateOfPayment;
    String? bank;
    String? paymentDetails;
    String? remarks;
    String? year;

    PaymentListResponse({
        this.id,
        this.cid,
        this.month,
        this.salesAmount,
        this.dateOfPayment,
        this.bank,
        this.paymentDetails,
        this.remarks,
        this.year,
    });

    factory PaymentListResponse.fromJson(Map<String, dynamic> json) => PaymentListResponse(
        id: json["id"],
        cid: json["cid"],
        month: json["month"],
        salesAmount: json["salesAmount"],
        dateOfPayment: json["dateOfPayment"] == null ? null : DateTime.parse(json["dateOfPayment"]),
        bank: json["bank"],
        paymentDetails: json["paymentDetails"],
        remarks: json["remarks"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cid": cid,
        "month": month,
        "salesAmount": salesAmount,
        "dateOfPayment": dateOfPayment?.toIso8601String(),
        "bank": bank,
        "paymentDetails": paymentDetails,
        "remarks": remarks,
        "year": year,
    };
}


PaymentListRequest paymentListRequestFromJson(String str) => PaymentListRequest.fromJson(json.decode(str));

String paymentListRequestToJson(PaymentListRequest data) => json.encode(data.toJson());

class PaymentListRequest {
    String? customerId;
    String? month;
    String? year;

    PaymentListRequest({
        this.customerId,
        this.month,
        this.year,
    });

    factory PaymentListRequest.fromJson(Map<String, dynamic> json) => PaymentListRequest(
        customerId: json["customerId"],
        month: json["month"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "month": month,
        "year": year,
    };
}
