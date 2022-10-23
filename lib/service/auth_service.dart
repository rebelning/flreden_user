import 'package:flrousale/domain/entity/user_model.dart';
import 'package:flrousale/flr_main.dart';

class AuthService extends EdenBaseService {
  bool? _isLogin;
  bool? get isLogin => _isLogin;
  String? storageToken;
  UserInfo? _userInfo;

  UserInfo? get userInfo => _userInfo;

  Future<AuthService> init() async {
    ConfigUser.getToken().then((token) {
      print("setting toekn....");
      EdenHttpHook.setToken(() => "Bearer $storageToken");
    });
    ConfigUser.getUserInfo().then((value) {
      if (value != null) {
        _isLogin = true;
      } else {
        _isLogin = false;
      }
      print("is login=$isLogin");
    });

    return this;
  }

  @override
  void onInit() {
    super.onInit();
    EdenHttpHook.setHttpProxy();
    EdenHttpHook.setUnauthorized(() {
      // print("setUnauthorized-unauthorized");
      // clearLogin();
    });

    EdenHttpHook.setError((value) {
      // print("httpHook-error=$value");
      EdenSnackbar(value.toString(), title: "错误");
    });
  }
}
