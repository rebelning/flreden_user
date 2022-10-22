import 'package:flrousale/app/routes/flroutes.dart';

class MenuItem {
  int? menuType;
  String? title;
  String? subTitle;
  String? icon;
  bool? hideIcon;
  bool? hideArrow;
  bool? hideBorder;
  String route;
  MenuItem({
    this.menuType,
    this.title,
    this.subTitle,
    this.icon,
    this.hideArrow = false,
    this.hideBorder = true,
    this.route = "/app/error/unknown404",
  });
}
