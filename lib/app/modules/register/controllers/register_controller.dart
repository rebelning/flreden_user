import 'package:flrousale/domain/repositories/register_respository.dart';
import 'package:flutter_eden/eden.dart';

class RegisterController extends EdenBaseController {
  final IRegisterRespository registerRespository;
  RegisterController({
    required this.registerRespository,
  });
  String? _phone;
  String? _hidePhoneNumber;
  String? _username;
  String? _password;
  String? get phone => _phone;
  String? get hidePhoneNumber => _hidePhoneNumber;
  String? get username => _username;
  String? get password => _password;
  @override
  void init() {
    _phone = Get.parameters["phone"];
    print("_phone=$phone");
    _setHintPhoneNumber();
  }

  void _setHintPhoneNumber() {
    if (_phone?.isNotEmpty == true) {
      _hidePhoneNumber =
          "${_phone?.substring(0, 3)}****${_phone?.substring(7, 11)}";
    }
  }

  void register() async {}

  @override
  void dealloc() {}
}
