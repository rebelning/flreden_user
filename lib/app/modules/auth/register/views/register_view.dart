import 'package:flreden_user/app/modules/auth/register/controllers/register_controller.dart';
import 'package:flreden_user/flr_main.dart';

class RegisterView {
  Widget renderRegisterView(
      BuildContext context, RegisterController _controller) {
    return Container(
      padding: EdgeInsets.only(left: 70.rpx, right: 70.rpx),
      child: ListView(
        children: [
          SizedBox(height: 94.rpx),
          _renderLogo(
            context,
            _controller.sectionTitle,
          ),
          _renderDescribeView(context, _controller),
          SizedBox(height: 100.rpx),
          _renderUsernameInput(context, (value) {
            _controller.setUsername(value);
          }),
          SizedBox(height: 20.rpx),
          _renderPwdInput(context, (value) {
            _controller.setPassword(value);
          }),
          SizedBox(height: 100.rpx),
          _renderComfirm(context, () {
            _controller.onRegister();
          }),
        ],
      ),
    );
  }

  Widget _renderLogo(
    BuildContext context,
    String? title,
  ) {
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
    Function(String) onChanged,
  ) {
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
        onChanged: onChanged,
      ),
    );
  }

  Widget _renderPwdInput(
    BuildContext context,
    Function(String) onChanged,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: FLRColors.black04,
        borderRadius: BorderRadius.circular(16.rpx),
      ),
      height: 100.rpx,
      child: InputWidget(
        placeholder: "请输入密码",
        obscureText: true,
        textStyle: TextStyle(
          color: FLRColors.black,
          fontSize: 30.rpx,
        ),
        showBorder: false,
        onChanged: onChanged,
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
        label: "注册",
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
