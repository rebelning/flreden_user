import 'package:flreden_user/domain/entity/menu_model.dart';
import 'package:flreden_user/domain/repositories/account_respository.dart';
import 'package:flreden_user/domain/repositories/impl/account/account_provider.dart';

class AccountRespositoryImpl implements IAccountRespository {
  final IAccountPorvider porvider;
  AccountRespositoryImpl({required this.porvider});
  @override
  Future<MenuModel?> getMenuList() async {
    final menu = await porvider.getMenuList();
    if (menu.status.hasError) {
      return Future.error(menu.statusText ?? "");
    } else {
      return menu.body;
    }
  }
}
