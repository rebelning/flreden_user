import 'dart:convert';

class UserInfo {
  String? token;
  int? companyId;
  int? companyNature;
  String? userId;
  String? username;
  String? mobile;
  String? address;
  String? accessToken;
  UserInfo({
    this.token,
    this.companyId,
    this.companyNature,
    this.userId,
    this.username,
    this.mobile,
    this.address,
    this.accessToken,
  });

  factory UserInfo.fromRawJson(String str) =>
      UserInfo.fromJson(json.decode(str) as Map<String, dynamic>);

  String? toRawJson() => json.encode(toJson());

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        token: json["token"],
        companyId: json["companyId"],
        companyNature: json["companyNature"],
        userId: json["userId"],
        username: json["username"],
        mobile: json["mobile"],
        address: json["address"],
        accessToken: json["accessToken"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "companyId": companyId,
        "companyNature": companyNature,
        "userId": userId,
        "username": username,
        "mobile": mobile,
        "address": address,
        "accessToken": accessToken,
      };
}
