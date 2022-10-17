import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/styles/app_colors.dart';
import '../../../core/ui/styles/button_styles.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/button.dart';
import 'presenter/login_presenter.dart';
import 'view/login_view_impl.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;
  const LoginPage({required this.presenter, super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LoginViewImpl {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: context.appColors.primary,
      body: Form(
        key: _formKey,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_login.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(10),
                sliver: SliverList(
                  delegate: SliverChildListDelegate.fixed([
                    SizedBox(
                      height: screenSize.height *
                          (screenSize.width > 350 ? 0.3 : 0.25),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          'Login',
                          style: context.textStyles.titleWhite,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      controller: _emailController,
                      validator: Validatorless.multiple([
                        Validatorless.required('Email requerido'),
                        Validatorless.email('Email inválido'),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Senha'),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                      controller: _passwordController,
                      obscureText: true,
                      validator: Validatorless.required('Senha obrigatória'),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        'Esqueceu a senha?',
                        style:
                            context.textStyles.textSecondaryFontMedium.copyWith(
                          color: context.appColors.yellow,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Button(
                      onPressed: _onPressedLogin,
                      width: screenSize.width * 0.9,
                      style: context.buttonStyles.yellowButton,
                      labelStyle: context
                          .textStyles.textSecondaryFontExtraBoldPrimaryColor,
                      label: 'Entrar',
                    ),
                  ]),
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      const Spacer(),
                      Text.rich(
                        TextSpan(
                          text: 'Não possui uma conta? ',
                          style: context.textStyles.textSecondaryFontMedium
                              .copyWith(color: Colors.white),
                          children: [
                            TextSpan(
                              text: 'Cadastre-se',
                              style: context.textStyles.textSecondaryFontMedium
                                  .copyWith(color: context.appColors.yellow),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamed('/auth/register'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressedLogin() {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid) {
      showLoader();
      widget.presenter.login(
        email: _emailController.text,
        password: _passwordController.text,
      );
    }
  }
}
