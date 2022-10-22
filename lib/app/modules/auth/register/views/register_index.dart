import 'package:flrousale/app/modules/auth/register/controllers/register_controller.dart';
import 'package:flrousale/app/modules/auth/register/views/register_view.dart';
import 'package:flutter_eden/eden.dart';

class RegisterIndex extends EdenBaseWidget<RegisterController>
    with RegisterView {
  @override
  String toolbarTitle() {
    return "注册";
  }

  @override
  Widget buildBody(BuildContext context, RegisterController _controller) {
    return renderRegisterView(context, _controller);
  }
}
