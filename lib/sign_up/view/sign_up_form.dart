import 'package:colorful_figures/sign_up/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pop();
        } else if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text(state.errorMessage ?? 'Sign Up Failure')),
            );
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _EmailInput(),
            const SizedBox(height: 8),
            _PasswordInput(),
            const SizedBox(height: 8),
            _ConfirmPasswordInput(),
            const SizedBox(height: 8),
            _SignUpButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.email.displayError,
    );

    return SizedBox(
      width: 200,
      child: TextField(
        key: const Key('signUpForm_emailInput_textField'),
        onChanged: (email) => context.read<SignUpCubit>().emailChanged(email),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'email',
          helperText: '',
          errorText: displayError != null ? 'Неверный email' : null,
        ),
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.password.displayError,
    );

    return TextField(
      key: const Key('signUpForm_passwordInput_textField'),
      onChanged: (password) =>
          context.read<SignUpCubit>().passwordChanged(password),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'пароль',
        helperText: '',
        errorText: displayError != null ? 'неверный пароль' : null,
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (SignUpCubit cubit) => cubit.state.confirmedPassword.displayError,
    );

    return TextField(
      key: const Key('signUpForm_confirmedPasswordInput_textField'),
      onChanged: (confirmPassword) =>
          context.read<SignUpCubit>().confirmedPasswordChanged(confirmPassword),
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'подтвердите пароль',
        helperText: '',
        errorText: displayError != null ? 'пароли не совпадают' : null,
      ),
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isInProgress = context.select(
      (SignUpCubit cubit) => cubit.state.status.isInProgress,
    );

    if (isInProgress) return const CircularProgressIndicator();

    final isValid = context.select(
      (SignUpCubit cubit) => cubit.state.isValid,
    );

    return ElevatedButton(
      key: const Key('signUpForm_continue_raisedButton'),
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 2, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 100, 150, 0),
          disabledBackgroundColor: Color.fromARGB(255, 0, 25, 50),
          textStyle: TextStyle(color: Colors.white)),
      onPressed: isValid
          ? () => context.read<SignUpCubit>().signUpFormSubmitted()
          : null,
      child: const Text('РЕГИСТРАЦИЯ'),
    );
  }
}
