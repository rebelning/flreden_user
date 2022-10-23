import 'package:flrousale/flr_main.dart';
import 'package:flrousale/service/auth_service.dart';

class SettingController extends EdenBaseController {
  String? _waringText;
  String? get waringText => _waringText;
  String? _phoneNumber;
  String? get phone => _phoneNumber;

  bool? _smsEnable = false;
  bool? get smsEnable => _smsEnable;

  bool? _messageEnable = false;
  bool? get messageEnable => _messageEnable;
  @override
  void init() {
    _waringText = "";

    ///
    _setHintPhoneNumber();
    setWaringText();
  }

  void _setHintPhoneNumber() {
    if (_phoneNumber?.isNotEmpty == true) {
      _phoneNumber =
          "${_phoneNumber?.substring(0, 3)}****${_phoneNumber?.substring(7, 11)}";
    }
  }

  void setWaringText() {
    _waringText = "当厂家回复且您未能及时查看消息的情况下，肉集集会发送短信到手机$_phoneNumber提醒您，每天提醒次数不超过3次";
  }

  void onSmsOff(bool switchValue) {
    _smsEnable = switchValue;
    update();
  }

  void onMssageOff(bool switchValue) {
    _messageEnable = switchValue;
    update();
  }

  void onExitLogin() {
    showEdenDialog(CustomDialog(
      titleText: "退出登录",
      confirmText: "退出",
      contentText: "你确定要退出当前登录么？",
      confirmTap: () {
        EdenRoute.back();
        _onExit();
      },
    ));
  }

  void _onExit() {
    showLoading(ConfigUser.exitLogin().then((value) {
      EdenRoute.offAllToNamed(FLRoutes.auth.root);
    }));
  }

  @override
  void dealloc() {}
}
