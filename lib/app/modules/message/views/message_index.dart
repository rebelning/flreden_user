import 'package:flutter_eden/eden.dart';
import 'package:flreden_user/app/modules/message/controllers/message_controller.dart';

class MessageIndex extends EdenBaseWidget<MessageController> {
  @override
  String toolbarTitle() {
    return "消息";
  }

  @override
  Widget buildBody(BuildContext context, MessageController _controller) {
    return Container();
  }
}
