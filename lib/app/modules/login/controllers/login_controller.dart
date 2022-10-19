import 'package:flrousale/app/routes/flroutes.dart';

import 'package:flrousale/domain/repositories/login_respository.dart';
import 'package:flutter_eden/eden.dart';

class LoginController extends EdenBaseController {
  final ILoginRespository loginRespository;
  LoginController({required this.loginRespository});
  String? _username;
  String? _password;
  String? get username => _username;
  String? get password => _password;
  @override
  void init() {}

  void setUsername(String? username) {
    _username = username;
  }

  void setPassword(String? password) {
    _password = password;
  }

  void login() async {
    await showLoading(loginRespository.doLogin(username, password))
        .then((value) {
      EdenRoute.push(FLRoutes.account.register,
          parameters: {"phone": username ?? ""});
    });
  }

  @override
  void dealloc() {}
}
