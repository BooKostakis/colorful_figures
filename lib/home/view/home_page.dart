import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colorful_figures/app/app.dart';
import 'package:colorful_figures/home/home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            key: const Key('homePage_logout_iconButton'),
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              context.read<AppBloc>().add(const AppLogoutPressed());
            },
          ),
        ],
      ),
      body: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 20),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Привет,\n',
                        style: textTheme.titleLarge,
                      ),
                      TextSpan(
                        text: user.email ?? '',
                        style: textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: '\n\nВо сколько цветов\nмне покрасить фигуру?',
                        style: textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                TextField(),
                SizedBox(height: 20),
                Text(
                  textAlign: TextAlign.center,
                  'Укажи число от 1 до 99',
                  style: textTheme.titleLarge,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
