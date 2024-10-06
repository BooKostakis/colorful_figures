import 'package:colorful_figures/colors_quantity/cubit/colors_quantity_cubit.dart';
import 'package:colorful_figures/figures_quantity/cubit/figures_quantity_cubit.dart';
import 'package:colorful_figures/result/view/rainbow_stack.dart';
import 'package:colorful_figures/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Squares extends StatelessWidget {
  const Squares({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter, // Начало градиента
                end: Alignment.topCenter, // Конец градиента
                colors: [
                  Color.fromARGB(255, 0, 35, 80),
                  Color.fromARGB(255, 0, 25, 50),
                ],
              ),
            ),
          ),
          title: Text(
            'Squares',
            style: theme.textTheme.displayMedium,
          ),
        ),
        body: Container(
          color: theme.colorScheme.primary,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: BlocProvider.of<FiguresQuantityCubit>(context)
                .state
                .figuresQuantity, // Количество виджетов
            itemBuilder: (context, index) {
              return Wrap(
                children: List.generate(
                  1, // Количество виджетов в строке
                  (index) => Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        RainbowStack(
                          maxWidth: 320,
                          maxHeigth: 320,
                          maxBorderRadius: 0,
                          colorsQuantity:
                              BlocProvider.of<ColorsQuantityCubit>(context)
                                  .state
                                  .colorsQuantity,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
