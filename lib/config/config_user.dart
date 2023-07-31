import 'package:flreden_user/domain/entity/login_model.dart';
import 'package:flreden_user/domain/entity/register_model.dart';
import 'package:flreden_user/domain/entity/user_model.dart';
import 'package:flreden_user/service/auth_service.dart';
import 'package:flutter_eden/eden.dart';

import 'constants.dart';

class ConfigUser {
  ConfigUser._();

  ///token
  static Future<String?> getToken() async {
    return await StorageHelper.get(StorageKeys.token);
  }

  ///get user info
  static Future<UserInfo?> getUserInfo() async {
    String? user = await StorageHelper.get(Constants.USER_INFO);
    print("userInfo=$user");
    if (user != null) {
      final loginInfo = LoginModel.fromRawJson(user);
      print("loginInfo=${loginInfo.toJson()}");
      return loginInfo.data;
    }

    return null;
  }

  ///set user info
  static setLoginInfo(LoginModel? login) async {
    String? token = login?.data?.token;
    StorageHelper.set(StorageKeys.token, token);
    StorageHelper.set(Constants.USER_INFO, login?.toRawJson());
  }

  ///
  static setRegisterInfo(RegisterModel? register) async {
    String? token = register?.data?.token;
    StorageHelper.set(StorageKeys.token, token);
    StorageHelper.set(Constants.USER_INFO, register?.toRawJson());
  }

  static Future _onClearLogin() async {
    StorageHelper.remove(StorageKeys.token);
    StorageHelper.remove(Constants.USER_INFO);
  }

  static Future onLogin(LoginModel? login) async {
    setLoginInfo(login);

    return await Get.find<AuthService>().init();
  }

  static Future exitLogin() async {
    _onClearLogin();
    return await Get.find<AuthService>().init();
  }
}
