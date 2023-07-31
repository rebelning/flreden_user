import 'dart:convert';

import 'package:flreden_user/domain/entity/user_model.dart';

class RegisterModel {
  int? code;
  String? msg;
  UserInfo? data;
  RegisterModel({
    this.code,
    this.msg,
    this.data,
  });
  factory RegisterModel.fromRawJson(String str) =>
      RegisterModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
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
