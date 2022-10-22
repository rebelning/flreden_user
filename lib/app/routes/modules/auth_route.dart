import 'package:flrousale/app/modules/account/address/controllers/address_add_controller.dart';
import 'package:flrousale/app/modules/account/address/controllers/address_managed_controller.dart';
import 'package:flrousale/app/modules/account/address/views/address_add_view.dart';
import 'package:flrousale/app/modules/account/address/views/address_managed_view.dart';
import 'package:flrousale/app/modules/account/info/controllers/personal_controller.dart';
import 'package:flrousale/app/modules/account/info/views/personal_index.dart';
import 'package:flrousale/app/modules/auth/login/controllers/login_controller.dart';
import 'package:flrousale/app/modules/auth/login/views/login_index.dart';
import 'package:flrousale/app/modules/auth/register/controllers/register_controller.dart';
import 'package:flrousale/app/modules/auth/register/views/register_index.dart';
import 'package:flrousale/app/modules/auth/sms/controllers/sms_controller.dart';
import 'package:flrousale/app/modules/auth/sms/views/sms_index.dart';

import 'package:flrousale/domain/repositories/impl/login/login_provider.dart';
import 'package:flrousale/domain/repositories/impl/login/login_respository_impl.dart';
import 'package:flrousale/domain/repositories/impl/register/register_provider.dart';
import 'package:flrousale/domain/repositories/impl/register/register_respository_impl.dart';
import 'package:flrousale/domain/repositories/login_respository.dart';
import 'package:flrousale/domain/repositories/register_respository.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flrousale/app/modules/account/controllers/account_controller.dart';
import 'package:flrousale/app/modules/account/views/account_index.dart';

class AuthRoute extends EdenBaseRoute {
  @override
  String get prefix => "/auth";
  String get root => "/";

  String get accountHome => prefix + "/account";

  String get login => prefix + "/login";

  String get register => prefix + "/register";

  ///
  String get smsIndex => prefix + "/login/smsIndex";

  String get personalIndex => prefix + "personalIndex";

  String get addressAddView => prefix + "addressAddView";
  String get addressManaged => prefix + "addressManaged";

  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: accountHome,
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
        },
      ),

      ///
      routePage(
        name: personalIndex,
        page: () => PersonalIndex(),
        bindingsBuilder: () {
          edenLazyPut(() => PersonalController());
        },
      ),

      ///
      routePage(
        name: addressManaged,
        page: () => AddressManagedView(),
        bindingsBuilder: () {
          edenLazyPut(() => AddressManagedController());
        },
      ),

      ///
      routePage(
        name: addressAddView,
        page: () => AddressAddView(),
        bindingsBuilder: () {
          edenLazyPut(() => AddressAddController());
        },
      ),
    ];
  }
}
