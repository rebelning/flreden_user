import 'package:flreden_user/app/modules/account/model/menu_item.dart';
import 'package:flreden_user/app/routes/flroutes.dart';
import 'package:flreden_user/values/flr_images.dart';
import 'package:flutter_eden/eden.dart';

class AccountController extends EdenBaseController {
  final _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;
  List<MenuItem>? _itemList = [];

  List<MenuItem>? get itemList => _itemList;

  @override
  void init() {
    _initMenuList();
  }

  ///
  Future onRefresh() async {
    // monitor network fetch

    await Future.delayed(const Duration(seconds: 2));
    _refreshController.refreshCompleted();
  }

  void _initMenuList() {
    _itemList?.add(
      MenuItem(
        menuType: 0,
        title: "我的商品",
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 1,
        title: "我的报价",
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 2,
        title: "我的订单",
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 3,
        title: "我的认证",
        icon: FLRImages.flr_cert_icon,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 3,
        title: "地址管理",
        icon: FLRImages.flr_address_icon,
        route: FLRoutes.account.addressManaged,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 3,
        title: "设置",
        icon: FLRImages.flr_setting_icon,
        route: FLRoutes.account.settingIndex,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 3,
        title: "关于",
        icon: FLRImages.flr_about_icon,
      ),
    );
    _itemList?.add(
      MenuItem(
        menuType: 3,
        title: "Proxy setting",
        icon: FLRImages.flr_about_icon,
        route: FLRoutes.eden.proxySeting,
      ),
    );

    ///
    for (int i = 0; i < 10; i++) {
      _itemList?.add(
        MenuItem(
          menuType: 4,
          title: "",
        ),
      );
    }
  }

  void onPersonalView() {
    EdenRoute.push(FLRoutes.account.personalIndex);
  }

  ///
  void onMenuItemView(String route) {
    EdenRoute.push(route);
  }

  @override
  void dealloc() {}
}
