// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.customerDetailsData,
    this.message,
    this.result,
  });

  CustomerDetailsData? customerDetailsData;
  String? message;
  bool? result;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) {
    var user = UserModel();
    user.customerDetailsData = json['CustomerDetailsData'];
    user.message = json['Message'];
    user.result = json['Result'];
    return user;
  }
  String toJson() => json.encode(toMap());
  Map<String, dynamic> toMap() => {
    "CustomerDetailsData": customerDetailsData!.toJson(),
    "Message": message,
    "Result": result,
  };
}

class CustomerDetailsData {
  CustomerDetailsData({
    this.mpin,
    this.aadharNo,
    this.address,
    this.balAmount,
    this.city,
    this.customerCode,
    this.customerId,
    this.customerRoleId,
    this.emailAddress,
    this.isKyc,
    this.isPlanLocked,
    this.isWhiteLable,
    this.mobileNo,
    this.mobileNumber,
    this.name,
    this.outletId,
    this.outletName,
    this.outletStatus,
    this.panCard,
    this.pinCode,
    this.roleName,
    this.state,
    this.status,
    this.upiId,
    this.websiteUrl,
  });

  String? mpin;
  String? aadharNo;
  String? address;
  double? balAmount;
  String? city;
  String? customerCode;
  int? customerId;
  int? customerRoleId;
  String? emailAddress;
  bool? isKyc;
  bool? isPlanLocked;
  bool? isWhiteLable;
  String? mobileNo;
  String? mobileNumber;
  String? name;
  String? outletId;
  String? outletName;
  String? outletStatus;
  String? panCard;
  String? pinCode;
  String? roleName;
  String? state;
  bool? status;
  String? upiId;
  String? websiteUrl;

  factory CustomerDetailsData.fromJson(Map<String, dynamic> json) => CustomerDetailsData(
    mpin: json["MPIN"],
    aadharNo: json["AadharNo"],
    address: json["Address"],
    balAmount: json["BalAmount"].toDouble(),
    city: json["City"],
    customerCode: json["CustomerCode"],
    customerId: json["CustomerId"],
    customerRoleId: json["CustomerRoleId"],
    emailAddress: json["EmailAddress"],
    isKyc: json["isKYC"],
    isPlanLocked: json["isPlanLocked"],
    isWhiteLable: json["isWhiteLable"],
    mobileNo: json["MobileNo"],
    mobileNumber: json["mobile_number"],
    name: json["Name"],
    outletId: json["outlet_Id"],
    outletName: json["Outlet_Name"],
    outletStatus: json["outlet_status"],
    panCard: json["PanCard"],
    pinCode: json["PinCode"],
    roleName: json["RoleName"],
    state: json["State"],
    status: json["Status"],
    upiId: json["UpiId"],
    websiteUrl: json["WebsiteURL"],
  );

  Map<String, dynamic> toJson() => {
    "MPIN": mpin,
    "AadharNo": aadharNo,
    "Address": address,
    "BalAmount": balAmount,
    "City": city,
    "CustomerCode": customerCode,
    "CustomerId": customerId,
    "CustomerRoleId": customerRoleId,
    "EmailAddress": emailAddress,
    "isKYC": isKyc,
    "isPlanLocked": isPlanLocked,
    "isWhiteLable": isWhiteLable,
    "MobileNo": mobileNo,
    "mobile_number": mobileNumber,
    "Name": name,
    "outlet_Id": outletId,
    "Outlet_Name": outletName,
    "outlet_status": outletStatus,
    "PanCard": panCard,
    "PinCode": pinCode,
    "RoleName": roleName,
    "State": state,
    "Status": status,
    "UpiId": upiId,
    "WebsiteURL": websiteUrl,
  };
}
