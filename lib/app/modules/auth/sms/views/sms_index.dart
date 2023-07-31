import 'package:flreden_user/app/modules/auth/sms/views/sms_view.dart';
import 'package:flreden_user/app/modules/auth/sms/controllers/sms_controller.dart';
import 'package:flreden_user/flr_main.dart';

class SmsIndex extends EdenBaseWidget<SmsController> with SmsView {
  @override
  String toolbarTitle() {
    return "Reset Password";
  }

  @override
  Widget buildBody(BuildContext context, SmsController _controller) {
    return renderSmsView(context, _controller);
  }
}
