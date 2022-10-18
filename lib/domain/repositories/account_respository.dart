import 'package:flrousale/domain/entity/menu_model.dart';

abstract class IAccountRespository {
  Future<MenuModel?> getMenuList();
}
