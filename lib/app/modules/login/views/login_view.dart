import 'package:flrousale/app/modules/login/controllers/login_controller.dart';

import 'package:flrousale/values/flr_colors.dart';
import 'package:flutter_eden/eden.dart';

class LoginView {
  Widget renderLoginView(BuildContext context, LoginController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 70.rpx, right: 70.rpx),
      child: ListView(
        children: [
          SizedBox(height: 170.rpx),
          _renderLogo(context),
          SizedBox(height: 100.rpx),
          _renderInput(context, _controller),
          SizedBox(height: 20.rpx),
          _renderCodeInput(context, _controller),
          SizedBox(height: 32.rpx),
          _renderPrivacyView(context),
          SizedBox(height: 100.rpx),
          _renderComfirm(context, _controller),
          SizedBox(height: 50.rpx),
          _renderTextComfirm(context),
        ],
      ),
    );
  }

  Widget _renderLogo(BuildContext context) {
    return Container(
      child: Text(
        "XXXXXXXXXX",
        style: TextStyle(
          color: FLRColors.black,
          fontSize: 54.rpx,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _renderInput(BuildContext context, LoginController _controller) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: CustomTextField(
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
        onChanged: (value) {
          _controller.setUsername(value);
        },
      ),
    );
  }

  Widget _renderCodeInput(BuildContext context, LoginController _controller) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: Row(
        children: [
          Expanded(
            child: CustomTextField(
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
              onChanged: (value) {
                _controller.setPassword(value);
              },
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

  Widget _renderPrivacyView(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderCheckedView(context, false),
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
    BuildContext context,
    bool isChecked,
  ) {
    return InkWell(
      onTap: () {
        // _onChecked();
      },
      child: Container(
        child: Column(
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
  Widget _renderComfirm(BuildContext context, LoginController _controller) {
    return Container(
      height: 95.rpx,
      child: ButtonWidget(
        label: "登录/注册",
        primary: FLRColors.color3792F0,
        onPrimary: Colors.white,
        fontSize: 32.rpx,
        fontHeight: 1.2,
        onPressed: () {
          _controller.login();
        },
        buttonType: ButtonType.ELEVATED,
      ),
    );
  }

  Widget _renderTextComfirm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150.rpx,
          height: 60.rpx,
          child: TextButton(
            onPressed: () {},
            child: Text("密码登录"),
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
