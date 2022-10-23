import 'dart:convert';

class SmsModel {
  int? code;
  String? msg;

  SmsModel({
    this.code,
    this.msg,
  });
  factory SmsModel.fromRawJson(String str) =>
      SmsModel.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());
  factory SmsModel.fromJson(Map<String, dynamic> json) => SmsModel(
        code: json["code"],
        msg: json["msg"],
      );
  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
