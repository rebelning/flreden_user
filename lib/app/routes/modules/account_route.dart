import 'package:flrousale/app/modules/login/controllers/login_controller.dart';
import 'package:flrousale/app/modules/login/views/login_index.dart';
import 'package:flrousale/app/modules/register/controllers/register_controller.dart';
import 'package:flrousale/app/modules/register/views/register_index.dart';
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

  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: home,
        page: () => AccountIndex(),
        bindingsBuilder: () {
          Get.lazyPut(() => AccountController());
        },
      ),
      routePage(
        name: login,
        page: () => LoginIndex(),
        bindingsBuilder: () {
          Get.lazyPut<ILoginProvider>(() => LoginProvider());
          Get.lazyPut<ILoginRespository>(
              () => LoginRespositoryImpl(provider: Get.find()));
          Get.lazyPut(() => LoginController(loginRespository: Get.find()));
        },
      ),
      routePage(
        name: register,
        page: () => RegisterIndex(),
        bindingsBuilder: () {
          Get.lazyPut<IRegisterProvider>(() => RegisterProvider());
          Get.lazyPut<IRegisterRespository>(
              () => RegisterRespositoryImpl(provider: Get.find()));
          Get.lazyPut(
              () => RegisterController(registerRespository: Get.find()));
        },
      )
    ];
  }
}
