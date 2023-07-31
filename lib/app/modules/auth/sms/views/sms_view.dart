import 'package:flreden_user/app/modules/auth/sms/controllers/sms_controller.dart';
import 'package:flreden_user/flr_main.dart';

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
          _renderPhoneInput(context, "请输入手机号", (value) {}),
          SizedBox(height: 20.rpx),
          _renderCodeInput(context, (value) {}),
          SizedBox(height: 100.rpx),
          _renderComfirm(context, () {}),
          // SizedBox(height: 50.rpx),
          // _renderTextComfirm(context),
        ],
      ),
    );
  }

  Widget _renderLogo(BuildContext context) {
    return Container(
      child: Text(
        "Rest Password",
        style: TextStyle(
          color: FLRColors.black,
          fontSize: 54.rpx,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _renderPhoneInput(
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

  Widget _renderCodeInput(
      BuildContext context, Function(String value)? onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: Row(
        children: [
          Expanded(
            child: InputWidget(
              placeholder: "请输入验证码",
              textStyle: TextStyle(
                color: FLRColors.black,
                fontSize: 30.rpx,
              ),
              showBorder: false,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.allow(RegExp("[0123456789]"))
              ],
              onChanged: onChanged,
            ),
          ),
          _renderVerifyCode(),
          SizedBox(width: 30.rpx),
        ],
      ),
    );
  }

  Widget _renderVerifyCode() {
    return Container(
      child: TextButton(
        onPressed: () {},
        style: _verifyButtonStyle(),
        child: Text("获取验证码"),
      ),
    );
  }

  ButtonStyle _verifyButtonStyle() {
    return TextButton.styleFrom(
      primary: FLRColors.color3792F0,
      minimumSize: Size(88.rpx, 60.rpx),
      textStyle: TextStyle(
        color: FLRColors.color3792F0,
        fontSize: 28.rpx,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.rpx)),
      ),
    );
  }

  //
  Widget _renderComfirm(
    BuildContext context,
    Function() onPressed,
  ) {
    return Container(
      height: 95.rpx,
      child: ButtonWidget(
        label: "下一步",
        primary: FLRColors.color3792F0,
        onPrimary: Colors.white,
        fontSize: 32.rpx,
        fontHeight: 1.2,
        onPressed: onPressed,
        buttonType: ButtonType.ELEVATED,
      ),
    );
  }
}
