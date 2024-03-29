import 'package:flreden_user/app/modules/auth/login/controllers/login_controller.dart';

import 'package:flreden_user/values/flr_colors.dart';
import 'package:flutter_eden/eden.dart';

class LoginView {
  ///
  Widget renderMobileLoginView(
      BuildContext context, LoginController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 70.rpx, right: 70.rpx),
      child: ListView(
        children: [
          SizedBox(height: 170.rpx),
          _renderLogo(
            context,
            _controller.sectionTitle,
          ),
          SizedBox(height: 100.rpx),

          ///phone
          _renderPhoneInput(context, (value) {
            _controller.setPhone(value);
          }),
          SizedBox(height: 20.rpx),

          ///code
          _renderCodeInput(
              context, _controller.isSendCode, _controller.millCount, (value) {
            _controller.setVerifyCode(value);
          }, () {
            _controller.sendCode();
          }),
          SizedBox(height: 32.rpx),

          ///privacy
          _renderPrivacyView(
            _controller.isPrivacy,
            () {
              _controller.setPrivacy();
            },
          ),
          SizedBox(height: 100.rpx),
          _renderComfirm(context, () {
            _controller.mobileLogin();
          }),
          SizedBox(height: 50.rpx),
          _renderTextComfirm(
            context,
            "密码登录",
            150.rpx,
            () {
              _controller.toUsernameLogin();
            },
          ),
        ],
      ),
    );
  }

  ///username login
  Widget renderUsernameLoginView(
      BuildContext context, LoginController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 70.rpx, right: 70.rpx),
      child: ListView(
        children: [
          SizedBox(height: 170.rpx),
          _renderLogo(
            context,
            _controller.sectionTitle,
          ),
          SizedBox(height: 100.rpx),
          _renderUsernameInput(context, (value) {
            _controller.setUsername(value);
          }),
          SizedBox(height: 20.rpx),
          _renderPasswordInput(context, (value) {
            _controller.setPassword(value);
          }),
          SizedBox(height: 32.rpx),

          ///privacy
          _renderPrivacyView(
            _controller.isPrivacy,
            () {
              _controller.setPrivacy();
            },
          ),
          SizedBox(height: 100.rpx),
          _renderComfirm(context, () {
            _controller.usernameLogin();
          }),
          SizedBox(height: 52.rpx),
          _renderTextComfirm(
            context,
            "短信验证码登录/注册",
            300.rpx,
            () {
              _controller.toMobileLogin();
            },
          ),
          SizedBox(height: 25.rpx),
          _renderTextComfirm(
            context,
            "忘记密码",
            150.rpx,
            () {
              _controller.forgetPassword();
            },
          ),
        ],
      ),
    );
  }

  Widget _renderLogo(BuildContext context, String? title) {
    return Container(
      child: Text(
        title ?? "",
        style: TextStyle(
          color: FLRColors.black,
          fontSize: 54.rpx,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _renderPhoneInput(
      BuildContext context, Function(String value)? onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: InputWidget(
        placeholder: "请输入手机号码",
        textStyle: TextStyle(
          color: FLRColors.black,
          fontSize: 30.rpx,
        ),
        showBorder: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(11),
          FilteringTextInputFormatter.allow(RegExp("[0123456789]"))
        ],
        onChanged: onChanged,
      ),
    );
  }

  Widget _renderCodeInput(
    BuildContext context,
    bool? isSendCode,
    int? countDown,
    Function(String value)? onChanged,
    Function() onPressed,
  ) {
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
          isSendCode == true
              ? _renderVerifyCode(onPressed)
              : _renderCountView(countDown),
          SizedBox(width: 30.rpx),
        ],
      ),
    );
  }

  Widget _renderUsernameInput(
      BuildContext context, Function(String value)? onChanged) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: InputWidget(
        placeholder: "请输入用户名",
        textStyle: TextStyle(
          color: FLRColors.black,
          fontSize: 30.rpx,
        ),
        showBorder: false,
        inputFormatters: [
          LengthLimitingTextInputFormatter(11),
          FilteringTextInputFormatter.allow(RegExp("^[a-z0-9A-Z]"))
        ],
        onChanged: onChanged,
      ),
    );
  }

  Widget _renderPasswordInput(
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
              placeholder: "请输入登录密码",
              obscureText: true,
              textStyle: TextStyle(
                color: FLRColors.black,
                fontSize: 30.rpx,
              ),
              showBorder: false,
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
                FilteringTextInputFormatter.allow(RegExp("^[a-z0-9A-Z.]"))
              ],
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderVerifyCode(Function() onPressed) {
    return Container(
      child: TextButton(
        onPressed: onPressed,
        style: _verifyButtonStyle(),
        child: Text("获取验证码"),
      ),
    );
  }

  Widget _renderCountView(int? count) {
    return Container(
      child: TextButton(
        onPressed: null,
        style: _verifyButtonStyle(),
        child: Text("${count}s后重新获取"),
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

  Widget _renderPrivacyView(bool? isChecked, Function() onPressed) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderCheckedView(
            isChecked,
            onPressed,
          ),
          Container(
              padding: EdgeInsets.only(left: 15.rpx, right: 15.rpx),
              child: Wrap(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "我已阅读并同意",
                          style: TextStyle(
                            color: FLRColors.black60,
                            fontSize: 26.rpx,
                          ),
                        ),
                        TextSpan(
                          text: "用户服务协议",
                          style: TextStyle(
                            color: FLRColors.color5AAAFC,
                            fontSize: 26.rpx,
                          ),
                        ),
                        TextSpan(
                          text: "及",
                          style: TextStyle(
                            color: FLRColors.black60,
                            fontSize: 26.rpx,
                          ),
                        ),
                        TextSpan(
                          text: "隐私政策",
                          style: TextStyle(
                            color: FLRColors.color5AAAFC,
                            fontSize: 26.rpx,
                          ),
                        ),
                        TextSpan(
                          text: "\n未注册手机号将自动注册",
                          style: TextStyle(
                            color: FLRColors.black60,
                            fontSize: 26.rpx,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _renderCheckedView(
    bool? isChecked,
    Function() onPressed,
  ) {
    return Container(
      height: 44.rpx,
      width: 44.rpx,
      child: IconButton(
        onPressed: onPressed,
        iconSize: 44.rpx,
        padding: EdgeInsets.zero,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isChecked == false
                  ? Icons.check_circle_sharp
                  : Icons.check_circle_outline,
              color: isChecked == false
                  ? FLRColors.black20
                  : FLRColors.color5AAAFC,
              size: 44.rpx,
            )
          ],
        ),
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
        label: "登录/注册",
        primary: FLRColors.color3792F0,
        onPrimary: Colors.white,
        fontSize: 32.rpx,
        fontHeight: 1.2,
        onPressed: onPressed,
        buttonType: ButtonType.ELEVATED,
      ),
    );
  }

  Widget _renderTextComfirm(
    BuildContext context,
    String? label,
    double? width,
    Function() onPwdLogin,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          height: 60.rpx,
          child: TextButton(
            onPressed: onPwdLogin,
            child: Text(label ?? ""),
            style: _textButtonStyle(),
          ),
        )
      ],
    );
  }

  ButtonStyle _textButtonStyle() {
    return TextButton.styleFrom(
      primary: FLRColors.black70,
      minimumSize: Size(88.rpx, 60.rpx),
      textStyle: TextStyle(
        color: FLRColors.black70,
        fontSize: 28.rpx,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.0.rpx),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0.rpx)),
      ),
    );
  }
}
