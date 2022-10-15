import 'package:flutter_eden/eden.dart';
import 'package:flrousale/app/modules/account/controllers/account_controller.dart';
import 'package:flrousale/app/modules/account/views/account_index.dart';

class AccountRoute extends EdenBaseRoute {
  @override
  String get prefix => "/account";

  String get home => prefix;

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
    ];
  }
}
