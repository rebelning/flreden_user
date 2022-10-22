import 'package:flrousale/domain/base/flr_end_points.dart';

import 'package:flrousale/domain/entity/register_model.dart';
import 'package:flutter_eden/eden.dart';

abstract class IRegisterProvider {
  Future<Response<RegisterModel?>> doRegister(
    String? phone,
    String? username,
    String? password,
  );
}

class RegisterProvider extends HttpTask implements IRegisterProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder =
        (val) => RegisterModel.fromJson(val as Map<String, dynamic>);
    super.onInit();
  }

  @override
  bool? needToken() {
    return false;
  }

  @override
  Future<Response<RegisterModel?>> doRegister(
      String? phone, String? username, String? password) {
    final path = login.authRegister;
    final playload = {
      "userName": "",
      "phone": phone,
      "nickName": username,
      "password": password,
      "nature": 1,
    };
    return post(path, playload);
  }
}
