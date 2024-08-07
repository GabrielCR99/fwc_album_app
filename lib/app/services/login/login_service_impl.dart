import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/auth/auth_repository.dart';
import 'login_service.dart';

final class LoginServiceImpl implements LoginService {
  final AuthRepository authRepository;

  const LoginServiceImpl({required this.authRepository});

  @override
  Future<void> execute({
    required String email,
    required String password,
  }) async {
    final accessToken = await authRepository.login(
      email: email,
      password: password,
    );

    final sp = await SharedPreferences.getInstance();
    await sp.setString('access_token', accessToken);
  }
}
