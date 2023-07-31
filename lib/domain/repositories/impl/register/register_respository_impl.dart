import 'package:flreden_user/domain/entity/register_model.dart';

import 'package:flreden_user/domain/repositories/impl/register/register_provider.dart';
import 'package:flreden_user/domain/repositories/register_respository.dart';

class RegisterRespositoryImpl implements IRegisterRespository {
  final IRegisterProvider provider;

  RegisterRespositoryImpl({
    required this.provider,
  });

  @override
  Future<RegisterModel?> doRegister(
      String? phone, String? username, String? password) async {
    final register = await provider.doRegister(phone, username, password);
    if (register.status.hasError) {
      return Future.error(register.statusText ?? "");
    } else {
      print("body=${register.body?.toJson()}");
      return register.body;
    }
  }
}
