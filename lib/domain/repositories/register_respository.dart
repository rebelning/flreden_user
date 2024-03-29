import 'package:flreden_user/domain/entity/register_model.dart';

abstract class IRegisterRespository {
  Future<RegisterModel?> doRegister(
    String? phone,
    String? username,
    String? password,
  );
}
