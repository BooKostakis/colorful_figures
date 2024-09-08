import 'package:colorful_figures/app/bloc/app_bloc.dart';
import 'package:colorful_figures/colors_quontity/cubit/colors_qountity_cubit.dart';
import 'package:colorful_figures/colors_quontity/view/colors_quontity_form.dart';
import 'package:colorful_figures/figures_quontity/cubit/figures_qountity_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsQuontityPage extends StatefulWidget {
  const ColorsQuontityPage({super.key});

  static Page<void> page() => MaterialPage<void>(child: ColorsQuontityPage());

  @override
  State<ColorsQuontityPage> createState() => _ColorsQuontityPageState();
}

class _ColorsQuontityPageState extends State<ColorsQuontityPage> {
  final _quantityController = TextEditingController();

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FiguresQuantityCubit()),
        BlocProvider(create: (context) => ColorsQuantityCubit()),
      ],
      child: Scaffold(
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
        // вот тут вопрос, почему стейт не видет и в форме нужно прописывать опять блокбилдер
        body: BlocBuilder<ColorsQuantityCubit, ColorsQuantityState>(
          builder: (context, state) {
            return Center(
              child: Container(
                color: Theme.of(context).colorScheme.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColorsQuontityForm(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
