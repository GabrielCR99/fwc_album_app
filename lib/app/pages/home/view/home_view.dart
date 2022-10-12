import '../../../models/user_model.dart';

abstract class HomeView {
  void updateUser(UserModel user);
  void onError(String message);
  void onLoading();
  void onSuccessLogout();
}
