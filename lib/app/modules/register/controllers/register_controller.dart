import 'package:flrousale/domain/repositories/register_respository.dart';
import 'package:flutter_eden/eden.dart';

class RegisterController extends EdenBaseController {
  final IRegisterRespository registerRespository;
  RegisterController({required this.registerRespository});
  @override
  void init() {}

  @override
  Future doRequest(bool isPull) async {}

  @override
  void dealloc() {}
}
