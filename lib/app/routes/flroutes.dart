import 'dart:async';

import 'package:flutter_eden/eden.dart';

import 'modules/auth_route.dart';

class FLRoutes {
  static final auth = AuthRoute();

  static final eden = EdenModuleRoute();
  static List<GetPage> getPages() {
    return [
      ...eden.getRoutePages(),
      ...auth.getRoutePages(),
    ];
  }
}
