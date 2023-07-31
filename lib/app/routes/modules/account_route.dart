import 'package:flreden_user/app/modules/account/address/controllers/address_add_controller.dart';
import 'package:flreden_user/app/modules/account/address/controllers/address_managed_controller.dart';
import 'package:flreden_user/app/modules/account/address/views/address_add_view.dart';
import 'package:flreden_user/app/modules/account/address/views/address_managed_view.dart';
import 'package:flreden_user/app/modules/account/info/controllers/personal_controller.dart';
import 'package:flreden_user/app/modules/account/info/views/personal_index.dart';
import 'package:flreden_user/app/modules/account/me/controllers/account_controller.dart';
import 'package:flreden_user/app/modules/account/me/views/account_index.dart';
import 'package:flreden_user/app/modules/account/setting/controllers/setting_controller.dart';
import 'package:flreden_user/app/modules/account/setting/views/setting_index.dart';

import 'package:flutter_eden/eden.dart';

class AccountRoute extends EdenBaseRoute {
  @override
  String get prefix => "/account";

  String get accountHome => prefix;

  String get settingIndex => prefix + "/settingIndex";

  String get personalIndex => prefix + "/personalIndex";

  String get addressAddView => prefix + "/addressAddView";
  String get addressManaged => prefix + "/addressManaged";

  @override
  List<GetPage> getRoutePages() {
    return [
      // routePage(
      //   name: accountHome,
      //   page: () => AccountIndex(),
      //   bindingsBuilder: () {
      //     edenLazyPut(() => AccountController());
      //   },
      // ),

      routePage(
          name: settingIndex,
          page: () => SettingIndex(),
          bindingsBuilder: () {
            edenLazyPut(() => SettingController());
          }),

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
