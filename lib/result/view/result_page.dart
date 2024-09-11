import 'package:colorful_figures/colors_quantity/cubit/colors_quantity_cubit.dart';
import 'package:colorful_figures/figures_quantity/cubit/figures_quantity_cubit.dart';
import 'package:colorful_figures/result/view/circles.dart';
import 'package:colorful_figures/result/view/rainbow_stack.dart';
import 'package:colorful_figures/result/view/squares.dart';
import 'package:colorful_figures/result/view/stars.dart';
import 'package:colorful_figures/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  int _selectedTab = 1;

  void onSelectedTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List<Widget> _widgetOptions = <Widget>[
    Stars(),
    Circles(),
    Squares(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 2, color: Colors.white)),
              backgroundColor: Color.fromARGB(255, 100, 150, 0)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 8, 5, 5),
            child: Text('Хочу еще!', style: theme.textTheme.bodyMedium),
          )),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      backgroundColor: Theme.of(context).colorScheme.primary,
      bottomNavigationBar: Container(
        height: 80,
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
        child: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            backgroundColor: Colors.transparent,
            currentIndex: _selectedTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Звезды',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.circle),
                label: 'Круги',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.square),
                label: 'Квадраты',
              ),
            ],
            onTap: onSelectedTab),
      ),
      body: _widgetOptions[_selectedTab],
    );
  }
}
