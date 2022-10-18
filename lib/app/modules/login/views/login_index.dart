import 'package:flrousale/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_eden/eden.dart';

import 'login_view.dart';

class LoginIndex extends EdenBaseWidget<LoginController> with LoginView {
  @override
  String toolbarTitle() {
    return "Login";
  }

  @override
  bool hideToolbar() {
    return true;
  }

  @override
  Widget buildBody(BuildContext context, LoginController _controller) {
    return renderLoginView(context, _controller);
  }
}
