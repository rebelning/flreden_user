import 'package:flreden_user/app/routes/flroutes.dart';
import 'package:flreden_user/config/config_user.dart';
import 'package:flreden_user/domain/entity/register_model.dart';
import 'package:flreden_user/domain/repositories/register_respository.dart';
import 'package:flutter_eden/eden.dart';

class RegisterController extends EdenBaseController {
  final IRegisterRespository registerRespository;
  RegisterController({
    required this.registerRespository,
  });
  String? _sectionTitle;
  String? get sectionTitle => _sectionTitle;
  String? _phone;
  String? _hidePhoneNumber;
  String? _username;
  String? _password;
  String? get phone => _phone;
  String? get hidePhoneNumber => _hidePhoneNumber;
  String? get username => _username;
  String? get password => _password;
  @override
  void init() {
    _sectionTitle = "Register";
    _phone = Get.parameters["phone"];

    _setHintPhoneNumber();
  }

  void setUsername(String? username) {
    _username = username;
  }

  void setPassword(String? password) {
    _password = password;
  }

  void _setHintPhoneNumber() {
    if (_phone?.isNotEmpty == true) {
      _hidePhoneNumber =
          "${_phone?.substring(0, 3)}****${_phone?.substring(7, 11)}";
    }
  }

  bool? _isUsernameNull() {
    if (username == null || username?.isEmpty == true) {
      EdenSnackbar("请输入用户名", title: "提示");
      return true;
    }
    if (password == null || password?.isEmpty == true) {
      EdenSnackbar("请输入密码", title: "提示");
      return true;
    }
    return false;
  }

  void onRegister() async {
    if (_isUsernameNull() == false) {
      await registerRespository
          .doRegister(phone, username, password)
          .then((value) {
        final code = value?.code;
        if (code == 0) {
          EdenSnackbar("注册成功", title: "提示");
          _registerSuccess(value);
        } else if (code == -2022) {
          EdenSnackbar("${value?.msg}", title: "提示");
        }
      });
    }
  }

  void _registerSuccess(RegisterModel? register) {
    ConfigUser.setRegisterInfo(register);
    EdenRoute.offAndToNamed(FLRoutes.auth.root);
  }

  @override
  void dealloc() {}
}
