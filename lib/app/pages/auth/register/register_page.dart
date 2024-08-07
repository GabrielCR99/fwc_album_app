import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/styles/text_styles.dart';
import '../../../core/ui/widgets/button.dart';
import 'presenter/register_presenter.dart';
import 'view/register_view_impl.dart';

final class RegisterPage extends StatefulWidget {
  final RegisterPresenter presenter;

  const RegisterPage({required this.presenter, super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

final class _RegisterPageState extends RegisterViewImpl {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bola.png'),
                  fit: BoxFit.fill,
                ),
              ),
              height: 106.82,
            ),
            const SizedBox(height: 50),
            Center(
              child: Text(
                'Cadastrar usuário',
                style: context.textStyles.titleBlack,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: 'Nome completo *'),
                    validator: Validatorless.required('Nome obrigatório'),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email *'),
                    validator: Validatorless.multiple([
                      Validatorless.required('Email obrigatório'),
                      Validatorless.email('Email inválido'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Senha *'),
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                        6,
                        'Senha deve ter no mínimo 6 dígitos',
                      ),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirmar senha *',
                    ),
                    obscureText: true,
                    validator: Validatorless.compare(
                      _passwordController,
                      'As senhas não conferem',
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button.primary(
                    label: 'Cadastrar',
                    width: MediaQuery.sizeOf(context).width * 0.9,
                    onPressed: _onPressedRegister,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onPressedRegister() {
    final formValid = _formKey.currentState!.validate();

    if (formValid) {
      showLoader();
      widget.presenter.register(
        name: _nameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
    }
  }
}
