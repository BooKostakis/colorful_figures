import 'package:colorful_figures/app/bloc/app_bloc.dart';
import 'package:colorful_figures/colors_quantity/view/colors_quantity_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsQuantityPage extends StatefulWidget {
  const ColorsQuantityPage({super.key});

  static Page<void> page() => MaterialPage<void>(child: ColorsQuantityPage());

  @override
  State<ColorsQuantityPage> createState() => _ColorsQuantityPageState();
}

class _ColorsQuantityPageState extends State<ColorsQuantityPage> {
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
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
                  Color.fromARGB(255, 0, 25, 50),
                  Color.fromARGB(255, 0, 35, 80),
                ],
              ),
            ),
          ),
          title: Text(
            'Colors Quantity',
          ),
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
        body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColorsQuantityForm(),
              ],
            ),
          ),
        ));
  }
}
