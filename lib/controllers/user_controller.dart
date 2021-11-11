import 'package:get/get.dart';

import '../models/user_info.dart';

class UserController extends GetxController {
  final UserInfo _currentUser = UserInfo.empty();

  UserInfo get currentUser => _currentUser;
}
