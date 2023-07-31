import 'package:flreden_user/app/modules/account/info/controllers/personal_controller.dart';
import 'package:flreden_user/app/modules/account/model/menu_item.dart';
import 'package:flreden_user/flr_main.dart';
import 'package:flreden_user/widgets/avatar_item_view.dart';
import 'package:flreden_user/widgets/menu_item_view.dart';

class PersonalIndex extends EdenBaseWidget<PersonalController> {
  @override
  String toolbarTitle() {
    return "个人资料";
  }

  @override
  Widget buildBody(BuildContext context, PersonalController _controller) {
    return Container(
      margin: EdgeInsets.only(top: 21.rpx),
      child: ListView.builder(
        itemBuilder: (context, index) {
          MenuItem? item = _controller.itemList![index];
          if (item.menuType == 0) {
            return AvatarItemView(
              title: "头像",
              hideBorder: item.hideBorder,
              onPressed: () {},
            );
          } else {
            return MenuItemView(
              title: item.title,
              subTitle: item.subTitle,
              hideBorder: item.hideBorder,
              onPressed: () {},
            );
          }
        },
        itemCount: _controller.itemList?.length,
      ),
    );
  }
}
