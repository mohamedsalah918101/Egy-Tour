import 'package:dartz/dartz.dart';
import 'package:egy_tour/core/utils/constants/constant_variables.dart';
import 'package:egy_tour/core/utils/functions/hive_services.dart';
import 'package:egy_tour/features/sign_up/data/models/user_model.dart';
import 'package:egy_tour/features/sign_up/data/repos/sign_up_repo.dart';

class SignUpRepoImp implements SignUpRepo {
  Service service = Service<User>(boxName: userBox);
  @override
  Future<Either<User, String>> signUp(User userModel) async {
    try {
      await service.addPerson(userModel);
      return left(userModel);
    } catch (e) {
      return right(e.toString());
    }
  }
}
