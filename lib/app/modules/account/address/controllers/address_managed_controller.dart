import 'package:flreden_user/flr_main.dart';

class AddressManagedController extends EdenBaseController {
  @override
  void init() {}

  void addAddress() {
    EdenRoute.push(FLRoutes.account.addressAddView);
  }

  @override
  void dealloc() {}
}
