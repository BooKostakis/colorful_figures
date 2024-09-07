import 'package:colorful_figures/theme.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
                Color.fromARGB(255, 0, 25, 50),
                Color.fromARGB(255, 0, 35, 80),
              ],
            ),
          ),
        ),
        title: Text(
          'Colorful figures',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Text(
            'Результат',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
