import 'package:authentication_repository/src/models/user.dart';
import 'package:colorful_figures/app/bloc/app_bloc.dart';
import 'package:colorful_figures/colors_quontity/cubit/colors_qountity_cubit.dart';
import 'package:colorful_figures/figures_quontity/cubit/figures_qountity_cubit.dart';
import 'package:colorful_figures/result/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiguresQuantityForm extends StatelessWidget {
  final _figuresQuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return BlocListener<FiguresQuantityCubit, FiguresQuantityState>(
      listener: (context, state) {},
      child: BlocBuilder<FiguresQuantityCubit, FiguresQuantityState>(
          builder: (context, state) {
        return SingleChildScrollView(
          child: Column(children: [
            SizedBox(width: double.infinity),
            HelloText(textTheme: textTheme, user: user),
            SizedBox(height: 20),
            ColorsQuantityField(
                figuresQuantityController: _figuresQuantityController),
            SizedBox(height: 20),
            NumericalInterval(textTheme: textTheme),
            SizedBox(height: 10),
            GoButton(figuresQuantityController: _figuresQuantityController),
            const SizedBox(height: 20),
            Logo(),
            SizedBox(height: 10),
            Text(
              'Количество фигур cейчас: ${state.figuresQuantity}',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 180, 220),
                  fontFamily: 'Block',
                  fontSize: 18),
            ),
          ]),
        );
      }),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      height: 60,
    );
  }
}

class GoButton extends StatelessWidget {
  const GoButton({
    super.key,
    required TextEditingController figuresQuantityController,
  }) : _figuresQuantityController = figuresQuantityController;

  final TextEditingController _figuresQuantityController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 2, color: Colors.white)),
          backgroundColor: Color.fromARGB(255, 100, 150, 0),
          disabledBackgroundColor: Color.fromARGB(255, 0, 25, 50),
          textStyle: TextStyle(color: Colors.white)),
      onPressed: () {
        final figuresQuantity =
            int.tryParse(_figuresQuantityController.text) ?? 1;
        BlocProvider.of<FiguresQuantityCubit>(context)
            .setFiguresQuantity(figuresQuantity);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResultPage()));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
        child: Text(
          'ВПЕРЕД',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class NumericalInterval extends StatelessWidget {
  const NumericalInterval({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      'Укажи число от 1 до 99',
      style: textTheme.titleLarge,
    );
  }
}

class ColorsQuantityField extends StatelessWidget {
  const ColorsQuantityField({
    super.key,
    required TextEditingController figuresQuantityController,
  }) : _figuresQuantityController = figuresQuantityController;

  final TextEditingController _figuresQuantityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: TextField(
        controller: _figuresQuantityController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: 'Количество фигур',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
    required this.textTheme,
    required this.user,
  });

  final TextTheme textTheme;
  final User user;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Отлично,\n',
            style: textTheme.titleLarge,
          ),
          TextSpan(
            text: user.email ?? '',
            style: textTheme.titleMedium,
          ),
          TextSpan(
            text: '\n ',
            style: TextStyle(fontSize: 10),
          ),
          TextSpan(
            text: '\nТеперь давай определимся,\nсколько фигур мы нарисуем',
            style: textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}




// @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final user = context.select((AppBloc bloc) => bloc.state.user);
//     return Scaffold(
//       appBar: AppBar(
        // flexibleSpace: Container(
        //   decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.bottomCenter, // Начало градиента
        //       end: Alignment.topCenter, // Конец градиента
        //       colors: [
        //         Color.fromARGB(255, 0, 25, 50),
        //         Color.fromARGB(255, 0, 35, 80),
        //       ],
        //     ),
        //   ),
        // ),
//         title: Text(
//           'Colorful Figures',
//           style: Theme.of(context).textTheme.displayMedium,
//         ),
//         actions: <Widget>[
//           IconButton(
//             key: const Key('homePage_logout_iconButton'),
//             icon: const Icon(Icons.exit_to_app),
//             onPressed: () {
//               context.read<AppBloc>().add(const AppLogoutPressed());
//             },
//           ),
//         ],
//       ),
//       body: Align(
//         alignment: const Alignment(0, -1 / 3),
//         child: Container(
//           width: double.infinity,
//           color: Theme.of(context).colorScheme.primary,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 SizedBox(height: 20),
                // RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     children: [
                //       TextSpan(
                //         text: 'Привет,\n',
                //         style: textTheme.titleLarge,
                //       ),
                //       TextSpan(
                //         text: user.email ?? '',
                //         style: textTheme.titleMedium,
                //       ),
                //       TextSpan(
                //         text: '\n\nВо сколько цветов\nмне покрасить фигуру?',
                //         style: textTheme.titleLarge,
                //       ),
                //     ],
                //   ),
                // ),
//                 SizedBox(height: 20),
//                 TextField(),
                // SizedBox(height: 20),
                // Text(
                //   textAlign: TextAlign.center,
                //   'Укажи число от 1 до 99',
                //   style: textTheme.titleLarge,
                // ),
//                 SizedBox(height: 20),
//                 ElevatedButton(onPressed: () {}, child: Text(''))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }