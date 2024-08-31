import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
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
            centerTitle: true,
            title: const Text(
              'Colorful figures',
              style: TextStyle(
                  fontFamily: 'Block',
                  fontSize: 32,
                  color: Colors.white,
                  letterSpacing: 1.5),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {}, child: const Text('Регистрация')),
                ],
              ),
            ),
          ),
          body: Container(
            color: const Color.fromARGB(255, 0, 25, 50),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 3,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft, // Начало градиента
                      end: Alignment.centerRight, // Конец градиента
                      colors: [
                        Color.fromARGB(255, 255, 165, 0),
                        Color.fromARGB(255, 255, 238, 0),
                        Color.fromARGB(255, 255, 165, 0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const TextField(),
                const TextField(),
                ElevatedButton(onPressed: () {}, child: const Text('Вперед'))
              ],
            ),
          )),
    );
  }
}
