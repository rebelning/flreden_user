import 'package:flreden_user/app/modules/account/address/controllers/address_managed_controller.dart';
import 'package:flreden_user/flr_main.dart';

class AddressManagedView extends EdenBaseWidget<AddressManagedController> {
  @override
  String toolbarTitle() {
    return "地址管理";
  }

  @override
  Widget? bottomNavigationBar() {
    return BottomAppBar(
      color: FLRColors.backroundColor,
      child: Container(
        padding: EdgeInsets.only(top: 10.rpx),
        height: 120.rpx,
        child: Column(
          children: [
            Container(
              height: 94.rpx,
              color: FLRColors.backroundColor,
              padding: EdgeInsets.only(left: 31.rpx, right: 31.rpx),
              child: ElevatedButton(
                onPressed: () {
                  controller.addAddress();
                },
                style: _elevatedButtonStyle(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 31.rpx,
                      color: FLRColors.white,
                    ),
                    Text("新建收货地址"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ButtonStyle _elevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      onPrimary: EdenColors.colorfafafa,
      primary: FLRColors.color3792F0,
      minimumSize: Size(88.rpx, 36.rpx),
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 20.rpx, vertical: 20.rpx),
      textStyle: TextStyle(
        fontSize: 33.rpx,
        fontWeight: FontWeight.w500,
        color: FLRColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(44.rpx)),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context, AddressManagedController _controller) {
    return Container();
  }
}
