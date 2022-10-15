import 'package:flutter_eden/eden.dart';
import 'package:flrousale/app/modules/account/controllers/account_controller.dart';

///
class AccountIndex extends EdenBaseWidget<AccountController> {
  @override
  String toolbarTitle() {
    return "我的";
  }

  @override
  Widget buildBody(BuildContext context, AccountController _controller) {
    return Container();
  }
}
