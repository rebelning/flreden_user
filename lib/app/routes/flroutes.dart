import 'dart:async';

import 'package:flreden_user/app/routes/modules/account_route.dart';
import 'package:flutter_eden/eden.dart';

import 'modules/auth_route.dart';

class FLRoutes {
  static final account = AccountRoute();
  static final auth = AuthRoute();

  static final eden = EdenModuleRoute();
  static List<GetPage> getPages() {
    return [
      ...eden.getRoutePages(),
      ...account.getRoutePages(),
      ...auth.getRoutePages(),
    ];
  }
}
