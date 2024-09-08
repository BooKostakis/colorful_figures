import 'package:colorful_figures/colors_quontity/cubit/colors_qountity_cubit.dart';
import 'package:colorful_figures/figures_quontity/cubit/figures_qountity_cubit.dart';
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
              'Результат: \n',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            BlocBuilder<FiguresQuantityCubit, FiguresQuantityState>(
                builder: (context, state) {
              return Text(
                'Количество фигур: ${state.figuresQuantity}',
                style: theme.textTheme.displayMedium,
              );
            }),
            BlocBuilder<ColorsQuantityCubit, ColorsQuantityState>(
                builder: (context, state) {
              return Text(
                'Количество цветов: ${state.colorsQuantity}',
                style: theme.textTheme.displayMedium,
              );
            }),
          ],
        ),
      ),
    );
  }
}
