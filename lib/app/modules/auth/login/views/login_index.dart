import 'package:flrousale/app/modules/auth/login/controllers/login_controller.dart';
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
    // return renderLoginView(context, _controller);
    return PageView(
      controller: _controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        EdenKeepAliveWrapper(
          child: renderMobileLoginView(context, _controller),
        ),
        EdenKeepAliveWrapper(
          child: renderUsernameLoginView(context, _controller),
        ),
      ],
    );
  }
}
