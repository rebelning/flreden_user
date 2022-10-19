import 'package:flrousale/app/modules/account/views/account_view.dart';
import 'package:flutter_eden/eden.dart';
import 'package:flrousale/app/modules/account/controllers/account_controller.dart';

///
class AccountIndex extends EdenBaseWidget<AccountController> with AccountView {
  @override
  String toolbarTitle() {
    return "我的";
  }

  @override
  bool hideToolbar() {
    return true;
  }

  @override
  Widget buildBody(BuildContext context, AccountController _controller) {
    return renderView(context, _controller);
  }
}
