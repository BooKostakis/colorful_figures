import 'package:colorful_figures/colors_quantity/cubit/colors_quantity_cubit.dart';
import 'package:colorful_figures/figures_quantity/cubit/figures_quantity_cubit.dart';
import 'package:colorful_figures/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    final figuresQuantityCubit = BlocProvider.of<FiguresQuantityCubit>(context);
    final colorsQuantityCubit = BlocProvider.of<ColorsQuantityCubit>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
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
          'Colorful figures',
          style: theme.textTheme.displayMedium,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Количество цветов: ${colorsQuantityCubit.state.colorsQuantity}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              'Количество фигур: ${figuresQuantityCubit.state.figuresQuantity}',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
