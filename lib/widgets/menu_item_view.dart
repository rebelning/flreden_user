import 'package:flrousale/flr_main.dart';

///
class MenuItemView extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? subTitle;
  final double? itemHeight;
  final bool? hideArrow;
  final bool? hideBorder;
  final Function()? onPressed;
  MenuItemView({
    Key? key,
    this.title,
    this.subTitle,
    this.icon,
    this.hideArrow,
    this.hideBorder = true,
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
          height: itemHeight ?? 94.rpx,
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
                if (icon != null) _renderIcon(),
                if (icon != null) SizedBox(width: 15.rpx),
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

  Widget _renderIcon() {
    return Container(
      width: 30.rpx,
      height: 30.rpx,
      child: Image.asset(
        "$icon",
        package: kPackage,
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
        Container(
          child: Text(
            subTitle ?? "",
            style: TextStyle(
              color: FLRColors.black,
              fontSize: 29.rpx,
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
        ),
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
              )
      ],
    );
  }
}
