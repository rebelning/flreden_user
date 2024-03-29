import 'package:flreden_user/domain/entity/login_model.dart';
import 'package:flreden_user/domain/entity/sms_model.dart';
import 'package:flreden_user/domain/repositories/impl/login/login_provider.dart';
import 'package:flreden_user/domain/repositories/login_respository.dart';

class LoginRespositoryImpl implements ILoginRespository {
  final ILoginProvider provider;

  LoginRespositoryImpl({
    required this.provider,
  });

  @override
  Future<LoginModel?> doMobileLogin(String? phone, String? code) async {
    final login = await provider.doMobileLogin(phone, code);

    if (login.status.hasError) {
      return Future.error(login.statusText ?? "");
    } else {
      print("body=${login.body?.toJson()}");
      return login.body;
    }
  }

  @override
  Future<LoginModel?> doUsernameLogin(
      String? username, String? password) async {
    final login = await provider.doUsernameLogin(username, password);

    if (login.status.hasError) {
      return Future.error(login.statusText ?? "");
    } else {
      print("body=${login.body?.toJson()}");
      return login.body;
    }
  }

  @override
  Future<SmsModel?> doSmsSend(String? phone) async {
    final login = await provider.doSmsSend(phone);

    if (login.status.hasError) {
      return Future.error(login.statusText ?? "");
    } else {
      print("body=${login.body?.toJson()}");
      return login.body;
    }
  }
}
