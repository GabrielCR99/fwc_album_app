import 'package:shared_preferences/shared_preferences.dart';

import './login_service.dart';
import '../../repositories/auth/auth_repository.dart';

class LoginServiceImpl implements LoginService {
  final AuthRepository _authRepository;

  const LoginServiceImpl({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<void> execute({
    required String email,
    required String password,
  }) async {
    final accessToken = await _authRepository.login(
      email: email,
      password: password,
    );

    final sp = await SharedPreferences.getInstance();
    await sp.setString('access_token', accessToken);
  }
}
