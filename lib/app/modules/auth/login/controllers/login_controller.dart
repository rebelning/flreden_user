import 'package:flreden_user/app/routes/flroutes.dart';
import 'package:flreden_user/config/config_user.dart';
import 'package:flreden_user/domain/entity/login_model.dart';
import 'package:flreden_user/domain/entity/sms_model.dart';

import 'package:flreden_user/domain/repositories/login_respository.dart';
import 'package:flreden_user/utils/flr_utils.dart';
import 'package:flutter_eden/eden.dart';

class LoginController extends EdenBaseController with FLRUtils {
  final ILoginRespository loginRespository;
  LoginController({required this.loginRespository});
  String? _sectionTitle;
  String? get sectionTitle => _sectionTitle;
  String? _username;
  String? _password;
  String? get username => _username;
  String? get password => _password;
  String? _phone;
  String? _code;
  String? get phone => _phone;
  String? get code => _code;

  bool? _isSendCode = true;
  bool? get isSendCode => _isSendCode;

  int? _millCount;
  int? get millCount => _millCount;

  bool? _isPrivacy = false;
  bool? get isPrivacy => _isPrivacy;

  final _pageController = PageController();
  get pageController => _pageController;

  @override
  void init() {
    _sectionTitle = "Login";
  }

  void _handleOnChange(int index) {
    pageController.jumpToPage(index);
  }

  void setUsername(String? username) {
    _username = username;
  }

  void setPassword(String? password) {
    _password = password;
  }

  void setPhone(String? phone) {
    _phone = phone;
  }

  void setVerifyCode(String? code) {
    _code = code;
  }

  void toMobileLogin() {
    _handleOnChange(0);
  }

  void toUsernameLogin() {
    _handleOnChange(1);
  }

  void forgetPassword() {
    EdenRoute.push(FLRoutes.auth.smsIndex);
  }

  void setPrivacy() {
    _isPrivacy == true ? _isPrivacy = false : _isPrivacy = true;
    update();
  }

  void sendCode() async {
    bool? isSend = await _sendSmsCode(phone);
    if (isSend == true) {
      _isSendCode = false;

      startCountDown((count) {
        if (isTimerDone) {
          _isSendCode = true;
        } else {
          _millCount = count;
          _isSendCode = false;
        }
        update();
      });
    }
  }

  bool? _isPhoneNumberNull() {
    if (phone == null || phone?.isEmpty == true) {
      EdenSnackbar("请输入手机号", title: "提示");
      return true;
    }
    return false;
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
    if (isPrivacy == false) {
      EdenSnackbar("请先同意服务协议", title: "提示");
      return true;
    }
    return false;
  }

  bool? _isMobileNull() {
    if (phone == null || phone?.isEmpty == true) {
      EdenSnackbar("请输入手机号", title: "提示");
      return true;
    }
    if (code == null || code?.isEmpty == true) {
      EdenSnackbar("请输入验证码", title: "提示");
      return true;
    }
    if (isPrivacy == false) {
      EdenSnackbar("请先同意服务协议", title: "提示");
      return true;
    }
    return false;
  }

  void mobileLogin() async {
    hideKeyboard();
    cancelTime();
    if (_isMobileNull() == false) {
      await showLoading(loginRespository.doMobileLogin(phone, code))
          .then((value) {
        final code = value?.code;
        if (code == 0) {
          ///login success
          EdenSnackbar("登录成功", title: "提示");
          _loginSuccess(value);
        } else if (code == -2022) {
          ///user not eixts
          EdenSnackbar("${value?.msg}", title: "提示");
          _pushRegister();
        } else {
          ///error
          EdenSnackbar("${value?.msg}", title: "提示");
        }
      });
    }
  }

  void _loginSuccess(LoginModel? login) {
    showLoading(ConfigUser.onLogin(login).then((value) {
      EdenRoute.offAllToNamed(FLRoutes.auth.root);
    }));
  }

  void _pushRegister() async {
    EdenRoute.push(
      FLRoutes.auth.register,
      parameters: {"phone": phone ?? ""},
    );
  }

  void usernameLogin() async {
    hideKeyboard();
    if (_isUsernameNull() == false) {
      await showLoading(loginRespository.doUsernameLogin(username, password))
          .then((value) {
        EdenRoute.push(
          FLRoutes.auth.register,
          parameters: {"phone": username ?? ""},
        );
      });
    }
  }

  Future<bool?> _sendSmsCode(String? phone) async {
    hideKeyboard();
    if (_isPhoneNumberNull() == false) {
      SmsModel? sms = await showLoading(loginRespository.doSmsSend(phone));
      print("sms=${sms?.toRawJson()}");
      if (sms?.code == 0) {
        return true;
      } else {
        EdenSnackbar("${sms?.msg}", title: "提示");
        return false;
      }
    }
    return false;
  }

  @override
  void dealloc() {
    cancelTime();
  }
}
