import '../_core/controller/base_controller.dart';

class UserController extends BaseController {
  isAuth() {
    return box.hasData('auth_token') ? true : false;
  }
}
