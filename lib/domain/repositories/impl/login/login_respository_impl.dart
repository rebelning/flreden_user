import 'package:flrousale/domain/entity/login_model.dart';
import 'package:flrousale/domain/repositories/impl/login/login_provider.dart';
import 'package:flrousale/domain/repositories/login_respository.dart';

class LoginRespositoryImpl implements ILoginRespository {
  final ILoginProvider provider;

  LoginRespositoryImpl({
    required this.provider,
  });

  @override
  Future<LoginModel?> doLogin(String? username, String? password) async {
    final login = await provider.doLogin(username, password);
    print("login.statusText=${login.statusText}");
    print("login.statusText=${login.status.code}");
    if (login.status.hasError) {
      return Future.error(login.statusText ?? "");
    } else {
      print("body=${login.body?.toJson()}");
      return login.body;
    }
  }
}
