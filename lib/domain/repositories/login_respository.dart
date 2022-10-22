import 'package:flrousale/domain/entity/login_model.dart';

abstract class ILoginRespository {
  ///login
  Future<LoginModel?> doMobileLogin(String? phone, String? code);
  Future<LoginModel?> doUsernameLogin(String? username, String? password);
}
