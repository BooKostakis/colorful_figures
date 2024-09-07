import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colorful_figures/login/login.dart';
import 'package:colorful_figures/sign_up/sign_up.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Authentication Failure'),
              ),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100,
              ),
              const SizedBox(height: 32),
              _EmailInput(),
              const SizedBox(height: 8),
              _PasswordInput(),
              const SizedBox(height: 8),
              _LoginButton(),
              const SizedBox(height: 8),
              _SignUpButton(),
              const SizedBox(height: 8),
              _GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.email.displayError,
    );

    return TextField(
      key: const Key('loginForm_emailInput_textField'),
      onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: Colors.white, fontFamily: 'Block', letterSpacing: 1.5),
        labelText: 'email',
        helperText: '',
        errorText: displayError != null ? 'неверный email' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginCubit cubit) => cubit.state.password.displayError,
    );

    return TextField(
      key: const Key('loginForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<LoginCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        labelStyle: TextStyle(
            color: Colors.white, fontFamily: 'Block', letterSpacing: 1.5),
        labelText: 'пароль',
        helperText: '',
        errorText: displayError != null ? 'неверный пароль' : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (LoginCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) return const CircularProgressIndicator();

    final isValid = context.select(
      (LoginCubit cubit) => cubit.state.isValid,
    );

    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 2, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 100, 150, 0),
          disabledBackgroundColor: Color.fromARGB(255, 0, 25, 50),
          textStyle: TextStyle(color: Colors.white)),
      onPressed: isValid
          ? () => context.read<LoginCubit>().logInWithCredentials()
          : null,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: const Text(
          'ВОЙТИ',
          style:
              TextStyle(color: Colors.white, fontFamily: 'Block', fontSize: 24),
        ),
      ),
    );
  }
}

class _GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return ElevatedButton(
        key: const Key('loginForm_googleLogin_raisedButton'),
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 2, color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 90, 95, 100),
            textStyle: TextStyle(color: Colors.white)),
        onPressed: () => context.read<LoginCubit>().logInWithGoogle(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.google,
              color: Theme.of(context).colorScheme.surface,
              size: 25,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 5, 5),
              child: const Text(
                'ВОЙТИ С ПОМОЩЬЮ АККАУНТА GOOGLE',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Block', fontSize: 18),
              ),
            ),
          ],
        ));
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      key: const Key('loginForm_createAccount_flatButton'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 2, color: Colors.white)),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          textStyle: TextStyle(color: Colors.white)),
      onPressed: () => Navigator.of(context).push<void>(SignUpPage.route()),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(3, 6, 3, 3),
        child: const Text(
          'РЕГИСТРАЦИЯ',
          style:
              TextStyle(color: Colors.white, fontFamily: 'Block', fontSize: 20),
        ),
      ),
    );
  }
}
