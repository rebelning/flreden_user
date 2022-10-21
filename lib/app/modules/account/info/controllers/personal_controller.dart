import 'package:flrousale/app/modules/account/model/menu_item.dart';
import 'package:flrousale/flr_main.dart';

class PersonalController extends EdenBaseController {
  final List<MenuItem>? _itemList = [];
  List<MenuItem>? get itemList => _itemList;
  @override
  void init() {
    _initMenu();
  }

  void _initMenu() {
    _itemList?.add(
      MenuItem(
        menuType: 0,
        title: "头像",
        hideBorder: false,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 1,
        title: "手机",
        subTitle: "138***13800",
        hideArrow: true,
        hideBorder: false,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 1,
        title: "实名认证",
        subTitle: "已认证",
        hideBorder: false,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 1,
        title: "企业认证",
        subTitle: "已认证",
        hideBorder: false,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 1,
        title: "银行卡",
        subTitle: "已绑定",
      ),
    );
  }

  @override
  void dealloc() {}
}
