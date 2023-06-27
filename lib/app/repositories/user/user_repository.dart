import '../../models/user_model.dart';

abstract interface class UserRepository {
  Future<UserModel> getMe();
}
