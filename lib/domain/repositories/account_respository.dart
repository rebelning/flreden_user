import 'package:flreden_user/domain/entity/menu_model.dart';

abstract class IAccountRespository {
  Future<MenuModel?> getMenuList();
}
