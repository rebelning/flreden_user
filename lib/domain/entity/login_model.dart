import 'dart:convert';

import 'user_model.dart';

///
class LoginModel {
  int? code;
  String? msg;
  UserInfo? data;
  LoginModel({
    this.code,
    this.msg,
    this.data,
  });
  factory LoginModel.fromRawJson(String str) =>
      LoginModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        code: json["code"],
        msg: json["msg"],
        data: UserInfo.fromJson(json["data"] ?? {}),
      );
  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data?.toJson(),
      };
}
