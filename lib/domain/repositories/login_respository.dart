import 'package:flreden_user/domain/entity/login_model.dart';
import 'package:flreden_user/domain/entity/sms_model.dart';

abstract class ILoginRespository {
  ///login
  Future<LoginModel?> doMobileLogin(String? phone, String? code);
  Future<LoginModel?> doUsernameLogin(String? username, String? password);
  Future<SmsModel?> doSmsSend(String? phone);
  // Future
}
