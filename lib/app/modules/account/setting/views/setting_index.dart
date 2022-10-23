import 'package:flrousale/app/modules/account/setting/controllers/setting_controller.dart';
import 'package:flrousale/flr_main.dart';
import 'package:flrousale/widgets/menu_item_view.dart';
import 'package:flrousale/widgets/switch_item_view.dart';

class SettingIndex extends EdenBaseWidget<SettingController> {
  @override
  String toolbarTitle() {
    return "设置";
  }

  @override
  Widget buildBody(BuildContext context, SettingController _controller) {
    return ListView(
      children: [
        SizedBox(height: 21.rpx),
        SwitchItemView(
          title: "短信提醒",
          itemHeight: 104.rpx,
          enable: _controller.smsEnable,
          onSwitch: (bool switchValue) {
            _controller.onSmsOff(switchValue);
          },
        ),
        _renderSmsWaring(_controller.waringText),
        SizedBox(height: 21.rpx),
        SwitchItemView(
          title: "消息通知",
          itemHeight: 104.rpx,
          enable: _controller.messageEnable,
          onSwitch: (bool switchValue) {
            _controller.onMssageOff(switchValue);
          },
        ),
        SizedBox(height: 21.rpx),
        MenuItemView(
          title: "清理缓存",
          itemHeight: 104.rpx,
          subTitle: "100M",
          subTitleColor: FLRColors.black40,
          hideArrow: true,
          onPressed: () {},
        ),
        SizedBox(height: 21.rpx),
        _renderExitButton(() {
          _controller.onExitLogin();
        }),
      ],
    );
  }

  Widget _renderSmsWaring(String? waringText) {
    return Container(
      padding: EdgeInsets.only(
          left: 31.rpx, top: 21.rpx, bottom: 21.rpx, right: 31.rpx),
      child: Text(
        waringText ?? "",
        style: TextStyle(
          color: FLRColors.black40,
          fontSize: 27.rpx,
        ),
      ),
    );
  }

  Widget _renderExitButton(Function() onPressed) {
    return Container(
      height: 104.rpx,
      color: FLRColors.white,
      child: TextButton(
        onPressed: onPressed,
        style: _textButtonStyle(),
        child: Text(
          "退出登录",
          style: TextStyle(
              color: FLRColors.colorFF4848,
              fontSize: 31.rpx,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  ButtonStyle _textButtonStyle() {
    return TextButton.styleFrom(
      primary: FLRColors.black04,
      minimumSize: Size(88.rpx, 60.rpx),
      padding: EdgeInsets.symmetric(horizontal: 16.0.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.rpx)),
      ),
    );
  }
}
