// To parse this JSON data, do
//
//     final bankAccountAddRequest = bankAccountAddRequestFromJson(jsonString);

import 'dart:convert';


BankAccountAddResponse bankAccountAddResponseFromJson(String str) => BankAccountAddResponse.fromJson(json.decode(str));

String bankAccountAddResponseToJson(BankAccountAddResponse data) => json.encode(data.toJson());

class BankAccountAddResponse {
    int? statusCode;
    String? statusMessage;

    BankAccountAddResponse({
        this.statusCode,
        this.statusMessage,
    });

    factory BankAccountAddResponse.fromJson(Map<String, dynamic> json) => BankAccountAddResponse(
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "statusMessage": statusMessage,
    };
}

BankAccountAddRequest bankAccountAddRequestFromJson(String str) => BankAccountAddRequest.fromJson(json.decode(str));

String bankAccountAddRequestToJson(BankAccountAddRequest data) => json.encode(data.toJson());

class BankAccountAddRequest {
    int? id;
    String? accNo;
    String? bank;
    String? ifsc;
    String? branch;
    String? state;
    String? isdeleted;
    String? createdby;
    DateTime? createdon;
    String? modifiedby;
    DateTime? modifiedon;

    BankAccountAddRequest({
        this.id,
        this.accNo,
        this.bank,
        this.ifsc,
        this.branch,
        this.state,
        this.isdeleted,
        this.createdby,
        this.createdon,
        this.modifiedby,
        this.modifiedon,
    });

    factory BankAccountAddRequest.fromJson(Map<String, dynamic> json) => BankAccountAddRequest(
        id: json["id"],
        accNo: json["accNo"],
        bank: json["bank"],
        ifsc: json["ifsc"],
        branch: json["branch"],
        state: json["state"],
        isdeleted: json["isdeleted"],
        createdby: json["createdby"],
        createdon: json["createdon"] == null ? null : DateTime.parse(json["createdon"]),
        modifiedby: json["modifiedby"],
        modifiedon: json["modifiedon"] == null ? null : DateTime.parse(json["modifiedon"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "accNo": accNo,
        "bank": bank,
        "ifsc": ifsc,
        "branch": branch,
        "state": state,
        "isdeleted": isdeleted,
        "createdby": createdby,
        "createdon": createdon?.toIso8601String(),
        "modifiedby": modifiedby,
        "modifiedon": modifiedon?.toIso8601String(),
    };
}
// To parse this JSON data, do
//
//     final bankAccountAddResponse = bankAccountAddResponseFromJson(jsonString);

