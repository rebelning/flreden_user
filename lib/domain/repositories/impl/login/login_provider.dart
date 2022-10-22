import 'package:flrousale/domain/base/flr_end_points.dart';
import 'package:flrousale/domain/entity/login_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class ILoginProvider {
  Future<Response<LoginModel>> doMobileLogin(String? phone, String? code);
  Future<Response<LoginModel>> doUsernameLogin(
      String? username, String? password);
}

class LoginProvider extends HttpTask implements ILoginProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LoginModel.fromJson(val as Map<String, dynamic>);
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
    return post(path, playload);
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
    return post(path, playload);
  }
}
