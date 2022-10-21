import 'package:flrousale/flr_main.dart';

///
class AvatarItemView extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? subTitle;
  final double? itemHeight;
  final bool? hideArrow;
  final bool? hideBorder;
  final Function()? onPressed;
  AvatarItemView({
    Key? key,
    this.title,
    this.subTitle,
    this.icon,
    this.hideArrow,
    this.hideBorder,
    this.itemHeight,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Ink(
      color: FLRColors.white,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: itemHeight ?? 188.rpx,
          padding: EdgeInsets.only(left: 31.rpx, right: 36.rpx),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: hideBorder == true
                    ? BorderSide.none
                    : BorderSide(
                        color: FLRColors.black06,
                        width: 1.rpx,
                      ),
              ),
            ),
            child: Row(
              children: [
                _renderLeading(),
                Expanded(
                  child: _renderTrailingView(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderAvatar() {
    return ClipOval(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              FLRColors.colorC7E4FF,
              FLRColors.color98CBFF,
            ],
          ),
        ),
        child: Icon(
          Icons.account_circle,
          color: FLRColors.colorDEEEFF,
          size: 50.rpx,
        ),
        height: 104.rpx,
        width: 104.rpx,
      ),
    );
  }

  Widget _renderLeading() {
    return Container(
      child: Text(
        title ?? "",
        style: TextStyle(
          color: FLRColors.black,
          fontSize: 29.rpx,
          fontWeight: FontWeight.w500,
          height: 1.1,
        ),
      ),
    );
  }

  Widget _renderTrailingView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _renderAvatar(),
        hideArrow == true
            ? SizedBox()
            : Container(
                margin: EdgeInsets.only(
                  left: 15.rpx,
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: FLRColors.color252C3250,
                  size: 21.rpx,
                ),
              ),
      ],
    );
  }
}
