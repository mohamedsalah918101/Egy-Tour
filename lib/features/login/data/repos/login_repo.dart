import 'package:egy_tour/features/sign_up/data/models/user_model.dart';

abstract class LoginRepo {
  Future<void> checkLogin(User user);
}
