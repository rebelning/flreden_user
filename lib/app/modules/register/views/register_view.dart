import 'package:flrousale/app/modules/register/controllers/register_controller.dart';
import 'package:flrousale/flr_main.dart';

class RegisterView {
  Widget renderRegisterView(
      BuildContext context, RegisterController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 70.rpx, right: 70.rpx),
      child: ListView(
        children: [
          SizedBox(height: 94.rpx),
          _renderLogo(context),
          _renderDescribeView(context, _controller),
          SizedBox(height: 100.rpx),
          _renderUsernameInput(context, _controller),
          SizedBox(height: 20.rpx),
          _renderPwdInput(context, _controller),
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
        "XXXXXXXXXX",
        style: TextStyle(
          color: FLRColors.black,
          fontSize: 54.rpx,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _renderDescribeView(
    BuildContext context,
    RegisterController _controller,
  ) {
    return Container(
      child: Text(
        "${_controller.hidePhoneNumber}尚未注册，请完善相关信息",
        style: TextStyle(
          color: FLRColors.black60,
          fontSize: 26.rpx,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _renderUsernameInput(
    BuildContext context,
    RegisterController _controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: CustomTextField(
        placeholder: "请输入用户名",
        textStyle: TextStyle(
          color: FLRColors.black,
          fontSize: 30.rpx,
        ),
        showBorder: false,
        onChanged: (value) {
          // _controller.setUsername(value);
        },
      ),
    );
  }

  Widget _renderPwdInput(
    BuildContext context,
    RegisterController _controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: CustomTextField(
        placeholder: "请输入密码",
        textStyle: TextStyle(
          color: FLRColors.black,
          fontSize: 30.rpx,
        ),
        showBorder: false,
        onChanged: (value) {
          // _controller.setUsername(value);
        },
      ),
    );
  }

  //
  Widget _renderComfirm(
    BuildContext context,
    RegisterController _controller,
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
          _controller.register();
        },
        buttonType: ButtonType.ELEVATED,
      ),
    );
  }
}
