// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.data,
    required this.support,
  });

  Data data;
  Support support;

  factory ProfileModel.fromJsonString(String str) => ProfileModel.fromMap(json.decode(str));


  factory ProfileModel.fromMap(Map<String, dynamic> json) {
    print(">>>>>>>>> ${json['data']}" ) ;
    var user = ProfileModel(data:json['data'] , support: json['support'] );
    // user.data = json['data'];
    // user.support = json['support'];
    return user;
  }

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(

    data: Data.fromJson(json["data"]),
    support: Support.fromJson(json["support"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "support": support.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]==null?"":json["id"],
    email: json["email"]==null?"":json["email"],
    firstName: json["first_name"]==null?"":json["first_name"],
    lastName: json["last_name"]==null?"":json["last_name"],
    avatar: json["avatar"]==null?"":json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "avatar": avatar,
  };
}

class Support {
  Support({
    required this.url,
    required this.text,
  });

  String url;
  String text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"]==null?"":json["url"],
    text: json["text"]==null?"":json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
