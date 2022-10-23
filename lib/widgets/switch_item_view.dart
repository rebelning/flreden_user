import 'package:flrousale/flr_main.dart';
import 'package:flutter/cupertino.dart';

class SwitchItemView extends StatelessWidget {
  final String? title;
  final bool? enable;
  final double? itemHeight;
  final Function(bool switchValue) onSwitch;
  SwitchItemView({
    Key? key,
    this.title,
    this.enable,
    this.itemHeight,
    required this.onSwitch,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: itemHeight ?? 94.rpx,
      padding: EdgeInsets.only(
          left: 31.rpx, top: 31.rpx, bottom: 31.rpx, right: 31.rpx),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? "",
            style: TextStyle(
              fontSize: 29.rpx,
              color: FLRColors.black,
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
          Container(
            width: 200.rpx,
            height: 52.rpx,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.scale(
                  scale: 0.75,
                  child: CupertinoSwitch(
                    value: enable ?? false,
                    trackColor: FLRColors.colorE5E5E5,
                    activeColor: FLRColors.color3792F0,
                    onChanged: (bool switchValue) {
                      onSwitch(switchValue);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
