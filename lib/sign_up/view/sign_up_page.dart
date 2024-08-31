import 'package:authentication_repository/authentication_repository.dart';
import 'package:colorful_figures/sign_up/cubit/sign_up_cubit.dart';
import 'package:colorful_figures/sign_up/view/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, // Начало градиента
                end: Alignment.topCenter, // Конец градиента
                colors: [
                  Color.fromARGB(255, 0, 25, 50), // Цвет начала градиента
                  Color.fromARGB(255, 0, 35, 80), // Цвет конца градиента
                ],
              ),
            ),
          ),
          title: const Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider<SignUpCubit>(
          create: (_) => SignUpCubit(context.read<AuthenticationRepository>()),
          child: const SignUpForm(),
        ),
      ),
    );
  }
}
