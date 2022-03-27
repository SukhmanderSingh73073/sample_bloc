// To parse this JSON data, do
//
//     final transactionModel = transactionModelFromJson(jsonString);

import 'dart:convert';

TransactionModel transactionModelFromJson(String str) => TransactionModel.fromJson(json.decode(str));

String transactionModelToJson(TransactionModel data) => json.encode(data.toJson());

class TransactionModel {
  TransactionModel(
  {required this.data}
  );

  List<Datum> data;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.apiName,
    required this.accountNo,
    required this.amount,
    required this.customerName,
    required this.productName,
    required this.refundedDate,
    required this.requestDate,
    required this.requestedAmt,
    required this.status,
    required this.transactionDate,
    required this.transactionId,
    required this.wallet,
    required this.operatorId,
    required this.vendorId,
  });

  String apiName;
  String accountNo;
  String amount;
  String customerName;
  String productName;
  String refundedDate;
  String requestDate;
  String requestedAmt;
  String status;
  String transactionDate;
  String transactionId;
  String wallet;
  String operatorId;
  String vendorId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    apiName: json["APIName"]== null ? "" : json["APIName"],
    accountNo: json["AccountNo"]== null ? "" : json["AccountNo"],
    amount: json["Amount"]== null ? "" : json["Amount"],
    customerName: json["CustomerName"]== null ? "" : json["CustomerName"],
    productName: json["ProductName"]== null ? "" : json["ProductName"],
    refundedDate: json["RefundedDate"]== null ? "" : json["RefundedDate"],
    requestDate: json["RequestDate"]== null ? "" : json["RequestDate"],
    requestedAmt: json["RequestedAmt"]== null ? "" : json["RequestedAmt"],
    status: json["Status"]== null ? "" : json["Status"],
    transactionDate: json["TransactionDate"]== null ? "" : json["TransactionDate"],
    transactionId: json["TransactionId"]== null ? "" : json["TransactionId"],
    wallet: json["Wallet"]== null ? "" : json["Wallet"],
    operatorId: json["OperatorId"] == null ? "" : json["OperatorId"],
    vendorId: json["VendorId"] == null ? "" : json["VendorId"],
  );

  Map<String, dynamic> toJson() => {
    "APIName": apiName == null ? "" : apiName,
    "AccountNo": accountNo == null ? "" : accountNo,
    "Amount": amount == null ? "" : amount,
    "CustomerName": customerName == null ? "" : customerName,
    "ProductName": productName == null ? "" : productName,
    "RefundedDate": refundedDate == null ? "" : refundedDate,
    "RequestDate": requestDate == null ? "" : requestDate,
    "RequestedAmt": requestedAmt == null ? "" : requestedAmt,
    "Status": status  == null ? "" : status,
    "TransactionDate": transactionDate == null ? "" : transactionDate,
    "TransactionId": transactionId == null ? "" : transactionId,
    "Wallet": wallet == null ? "" : wallet,
    "OperatorId": operatorId == null ? "" : operatorId,
    "VendorId": vendorId == null ? "" : vendorId,
  };
}

