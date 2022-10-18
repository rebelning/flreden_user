import 'package:flutter_eden/eden.dart';

import 'modules/account_route.dart';

class FlRoutes {
  static final account = AccountRoute();
  static final message = AccountRoute();
  static List<GetPage> getPages() {
    return [
      ...account.getRoutePages(),
      ...message.getRoutePages(),
    ];
  }
}
