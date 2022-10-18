import 'package:flrousale/domain/entity/login_model.dart';

import 'package:flrousale/domain/repositories/impl/register/register_provider.dart';
import 'package:flrousale/domain/repositories/register_respository.dart';

class RegisterRespositoryImpl implements IRegisterRespository {
  final IRegisterProvider provider;

  RegisterRespositoryImpl({
    required this.provider,
  });

  @override
  Future<LoginModel?> doLogin(String? username, String? password) async {
    final login = await provider.doLogin(username, password);
    if (login.status.hasError) {
      return Future.error(login.statusText ?? "");
    } else {
      print("body=${login.body?.toJson()}");
      return login.body;
    }
  }
}
