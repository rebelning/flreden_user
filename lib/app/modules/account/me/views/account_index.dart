import 'package:flreden_user/app/modules/account/me/controllers/account_controller.dart';
import 'package:flreden_user/app/modules/account/me/views/account_view.dart';
import 'package:flutter_eden/eden.dart';

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
