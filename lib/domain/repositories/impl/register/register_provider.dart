import 'package:flrousale/domain/base/flr_end_points.dart';
import 'package:flrousale/domain/entity/login_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class IRegisterProvider {
  Future<Response<LoginModel>> doLogin(String? username, String? password);
}

class RegisterProvider extends HttpTask implements IRegisterProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => LoginModel.fromJson(val as Map<String, dynamic>);
    super.onInit();
  }

  @override
  Future<Response<LoginModel>> doLogin(String? username, String? password) {
    final path = login.authLogin;
    final playload = {
      "username": username,
      "password": password,
    };
    return post(path, playload);
  }

  @override
  bool? needToken() {
    return false;
  }
}
