import 'package:flrousale/app/modules/login/controllers/login_controller.dart';
import 'package:flrousale/app/modules/login/views/login_index.dart';
import 'package:flrousale/app/modules/register/controllers/register_controller.dart';
import 'package:flrousale/app/modules/register/views/register_index.dart';
import 'package:flrousale/app/modules/sms/controllers/sms_controller.dart';
import 'package:flrousale/app/modules/sms/views/sms_index.dart';
import 'package:flrousale/domain/repositories/impl/login/login_provider.dart';
import 'package:flrousale/domain/repositories/impl/login/login_respository_impl.dart';
import 'package:flrousale/domain/repositories/impl/register/register_provider.dart';
import 'package:flrousale/domain/repositories/impl/register/register_respository_impl.dart';
import 'package:flrousale/domain/repositories/login_respository.dart';
import 'package:flrousale/domain/repositories/register_respository.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flrousale/app/modules/account/controllers/account_controller.dart';
import 'package:flrousale/app/modules/account/views/account_index.dart';

class AccountRoute extends EdenBaseRoute {
  @override
  String get prefix => "/account";

  String get home => prefix;

  String get login => prefix + "/login";

  String get register => prefix + "/register";

  ///
  String get smsIndex => prefix + "/smsIndex";

  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: home,
        page: () => AccountIndex(),
        bindingsBuilder: () {
          edenLazyPut(() => AccountController());
        },
      ),
      routePage(
        name: login,
        page: () => LoginIndex(),
        bindingsBuilder: () {
          edenLazyPut<ILoginProvider>(() => LoginProvider());
          edenLazyPut<ILoginRespository>(
              () => LoginRespositoryImpl(provider: edenFind()));
          edenLazyPut(() => LoginController(loginRespository: edenFind()));
        },
      ),
      routePage(
        name: register,
        page: () => RegisterIndex(),
        bindingsBuilder: () {
          edenLazyPut<IRegisterProvider>(() => RegisterProvider());
          edenLazyPut<IRegisterRespository>(
              () => RegisterRespositoryImpl(provider: edenFind()));
          edenLazyPut(
              () => RegisterController(registerRespository: edenFind()));
        },
      ),
      routePage(
          name: smsIndex,
          page: () => SmsIndex(),
          bindingsBuilder: () {
            edenLazyPut(() => SmsController());
          })
    ];
  }
}
