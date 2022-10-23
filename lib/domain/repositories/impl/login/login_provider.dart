import 'package:flrousale/domain/base/flr_end_points.dart';
import 'package:flrousale/domain/entity/login_model.dart';
import 'package:flrousale/domain/entity/sms_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class ILoginProvider {
  Future<Response<LoginModel>> doMobileLogin(String? phone, String? code);
  Future<Response<LoginModel>> doUsernameLogin(
      String? username, String? password);
  Future<Response<SmsModel>> doSmsSend(String? phone);
}

class LoginProvider extends HttpTask implements ILoginProvider {
  @override
  void onInit() {
    // httpClient.defaultDecoder =
    //     (val) => LoginModel.fromJson(val as Map<String, dynamic>);
    super.onInit();
  }

  @override
  bool? needToken() {
    return false;
  }

  @override
  Future<Response<LoginModel>> doMobileLogin(String? phone, String? code) {
    final path = login.authLogin;
    final playload = {
      "loginName": phone,
      "code": code,
    };
    print("playload=$playload");
    return post<LoginModel>(
      path,
      playload,
      decoder: (val) => LoginModel.fromJson(val as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<LoginModel>> doUsernameLogin(
      String? username, String? password) {
    final path = login.authLogin;
    final playload = {
      "loginName": username,
      "code": password,
    };
    print("playload=$playload");
    return post<LoginModel>(
      path,
      playload,
      decoder: (val) => LoginModel.fromJson(val as Map<String, dynamic>),
    );
  }

  @override
  Future<Response<SmsModel>> doSmsSend(String? phone) async {
    final path = login.smsLogin + "/$phone";
    return get<SmsModel>(
      path,
      decoder: (val) => SmsModel.fromJson(val as Map<String, dynamic>),
    );
  }
}
