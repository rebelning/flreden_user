// ignore: library_prefixes
import 'flr_base_url.dart' as BASE_URL;

class _Login {
  ///Register
  final authRegister = BASE_URL.HTTP_DOMAIN + "/api/company/register";

  ///Login
  final authLogin = BASE_URL.HTTP_DOMAIN + "/api/company/sms/login";

  ///sms login
  final smsLogin = BASE_URL.HTTP_DOMAIN + "/api/sms/loginCode";

  ///sms Reset
  final smsReset = BASE_URL.HTTP_DOMAIN + "api/sms/resetCode";
}

class _AppList {
  final menuList = BASE_URL.HTTP_DOMAIN + "/config/menulist";
  final messageList = BASE_URL.HTTP_DOMAIN + "/config/messagelist";
}

final login = _Login();
final appList = _AppList();
