import 'package:flrousale/flr_main.dart';

class AddressManagedController extends EdenBaseController {
  @override
  void init() {}

  void addAddress() {
    EdenRoute.push(FLRoutes.auth.addressAddView);
  }

  @override
  void dealloc() {}
}
