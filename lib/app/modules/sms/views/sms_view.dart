import 'package:flrousale/app/modules/sms/controllers/sms_controller.dart';
import 'package:flrousale/flr_main.dart';

class SmsView {
  Widget renderSmsView(
    BuildContext context,
    SmsController _controller,
  ) {
    return Container(
      padding: EdgeInsets.only(left: 70.rpx, right: 70.rpx),
      child: ListView(
        children: [
          SizedBox(height: 94.rpx),
          _renderLogo(context),

          SizedBox(height: 100.rpx),
          _renderPwdInput(context, "请输入新密码", (value) {}),
          SizedBox(height: 20.rpx),
          _renderPwdInput(context, "请再次输入新密码", (value) {}),
          SizedBox(height: 100.rpx),
          _renderComfirm(context, _controller),
          // SizedBox(height: 50.rpx),
          // _renderTextComfirm(context),
        ],
      ),
    );
  }

  Widget _renderLogo(BuildContext context) {
    return Container(
      child: Text(
        "Rest password",
        style: TextStyle(
          color: FLRColors.black,
          fontSize: 54.rpx,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _renderPwdInput(
    BuildContext context,
    String? placeholder,
    Function(String)? onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: CustomTextField(
        placeholder: placeholder,
        textStyle: TextStyle(
          color: FLRColors.black,
          fontSize: 30.rpx,
        ),
        showBorder: false,
        inputFormatters: [
          // LengthLimitingTextInputFormatter(6),
          FilteringTextInputFormatter.allow(RegExp("^[a-z0-9A-Z.]"))
        ],
        onChanged: onChanged,
      ),
    );
  }

  //
  Widget _renderComfirm(
    BuildContext context,
    SmsController _controller,
  ) {
    return Container(
      height: 95.rpx,
      child: ButtonWidget(
        label: "注册",
        primary: FLRColors.color3792F0,
        onPrimary: Colors.white,
        fontSize: 32.rpx,
        fontHeight: 1.2,
        onPressed: () {
          // _controller.register();
        },
        buttonType: ButtonType.ELEVATED,
      ),
    );
  }
}
