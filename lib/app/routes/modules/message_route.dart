import 'package:flutter_eden/eden.dart';
import 'package:flrousale/app/modules/message/controllers/message_controller.dart';
import 'package:flrousale/app/modules/message/views/message_index.dart';

///
class MessageRoute extends EdenBaseRoute {
  @override
  String get prefix => "/message";
  String get home => prefix;
  @override
  List<GetPage> getRoutePages() {
    return [
      routePage(
        name: home,
        page: () => MessageIndex(),
        bindingsBuilder: () {
          edenLazyPut(() => MessageController());
        },
      ),
    ];
  }
}
