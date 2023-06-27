final class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  const RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
