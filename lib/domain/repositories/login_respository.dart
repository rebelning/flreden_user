import 'package:flrousale/domain/entity/login_model.dart';

abstract class ILoginRespository {
  ///login
  Future<LoginModel?> doLogin(String? username, String? password);
}
