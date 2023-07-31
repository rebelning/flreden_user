import 'package:flreden_user/app/modules/auth/login/controllers/login_controller.dart';
import 'package:flreden_user/app/modules/auth/login/views/login_index.dart';
import 'package:flreden_user/app/modules/auth/register/controllers/register_controller.dart';
import 'package:flreden_user/app/modules/auth/register/views/register_index.dart';
import 'package:flreden_user/app/modules/auth/sms/controllers/sms_controller.dart';
import 'package:flreden_user/app/modules/auth/sms/views/sms_index.dart';

import 'package:flreden_user/domain/repositories/impl/login/login_provider.dart';
import 'package:flreden_user/domain/repositories/impl/login/login_respository_impl.dart';
import 'package:flreden_user/domain/repositories/impl/register/register_provider.dart';
import 'package:flreden_user/domain/repositories/impl/register/register_respository_impl.dart';
import 'package:flreden_user/domain/repositories/login_respository.dart';
import 'package:flreden_user/domain/repositories/register_respository.dart';
import 'package:flutter_eden/eden.dart';

class AuthRoute extends EdenBaseRoute {
  @override
  String get prefix => "/auth";
  String get root => "/";

  String get login => prefix + "/login";

  String get register => prefix + "/register";

  ///
  String get smsIndex => prefix + "/smsIndex";

  @override
  List<GetPage> getRoutePages() {
    return [
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
        },
      ),
    ];
  }
}
