import '../../../models/user_model.dart';

abstract interface class HomeView {
  void updateUser(UserModel user);
  void onError(String message);
  void onLoading();
  void onSuccessLogout();
}
