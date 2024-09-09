import 'package:authentication_repository/src/models/user.dart';
import 'package:colorful_figures/app/bloc/app_bloc.dart';
import 'package:colorful_figures/colors_quantity/cubit/colors_quantity_cubit.dart';
import 'package:colorful_figures/figures_quantity/cubit/figures_quantity_cubit.dart';
import 'package:colorful_figures/figures_quantity/cubit/figures_quantity_state.dart';
import 'package:colorful_figures/figures_quantity/view/figures_quantity_page.dart';
import 'package:colorful_figures/result/view/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FiguresQuantityForm extends StatelessWidget {
  final _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final colorsQuantityCubit = BlocProvider.of<ColorsQuantityCubit>(context);
    final figuresQuantityCubit = BlocProvider.of<FiguresQuantityCubit>(context);
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
            SizedBox(height: 25),
            FiguresQuantityField(quantityController: _quantityController),
            SizedBox(height: 5),
            NumericalInterval(textTheme: textTheme),
            SizedBox(height: 10),
            GoButton(quantityController: _quantityController),
            const SizedBox(height: 20),
            Logo(),
            SizedBox(height: 10),
            Text(
              'Количество цветов cейчас: ${colorsQuantityCubit.state.colorsQuantity}',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 180, 220),
                  fontFamily: 'Block',
                  fontSize: 18),
            ),
            Text(
              'Количество фигур cейчас: ${figuresQuantityCubit.state.figuresQuantity}',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 180, 220),
                  fontFamily: 'Block',
                  fontSize: 18),
            )
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
    required TextEditingController quantityController,
  }) : _quantityController = quantityController;

  final TextEditingController _quantityController;

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
        final quantity = int.tryParse(_quantityController.text) ?? 1;
        BlocProvider.of<FiguresQuantityCubit>(context)
            .setFiguresQuantity(quantity);
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

class FiguresQuantityField extends StatelessWidget {
  const FiguresQuantityField({
    super.key,
    required TextEditingController quantityController,
  }) : _quantityController = quantityController;

  final TextEditingController _quantityController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      child: TextField(
        maxLength: 2,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
        ],
        controller: _quantityController,
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



























// class FiguresQuantityForm extends StatelessWidget {
//   final _figuresQuantityController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     final user = context.select((AppBloc bloc) => bloc.state.user);
//     // final colorsQuantityCubit = context.select((ColorsQuantityCubit bloc) => bloc.state.colorsQuantity);
//     final colorsQuantityCubit = BlocProvider.of<ColorsQuantityCubit>(context);
//     final figuresQuantityCubit = BlocProvider.of<FiguresQuantityCubit>(context);
//     return BlocListener<FiguresQuantityCubit, FiguresQuantityState>(
//       listener: (context, state) {},
//       child: BlocBuilder<FiguresQuantityCubit, FiguresQuantityState>(
//           builder: (context, state) {
//         return SingleChildScrollView(
//           child: Column(children: [
//             SizedBox(width: double.infinity),
//             HelloText(textTheme: textTheme, user: user),
//             SizedBox(height: 20),
//             FiguresQuantityField(
//                 figuresQuantityController: _figuresQuantityController),
//             SizedBox(height: 20),
//             NumericalInterval(textTheme: textTheme),
//             SizedBox(height: 10),
//             GoButton(figuresQuantityController: _figuresQuantityController),
//             const SizedBox(height: 20),
//             Logo(),
//             SizedBox(height: 10),
//             Text(
//               'Количество фигур cейчас: ${figuresQuantityCubit.state.figuresQuantity}',
//               style: TextStyle(
//                   color: const Color.fromARGB(255, 0, 180, 220),
//                   fontFamily: 'Block',
//                   fontSize: 18),
//             ),
//             BlocBuilder<ColorsQuantityCubit, ColorsQuantityState>(
//                 builder: (context, state) {
//               return Text(
//                 'Количество цветов cейчас: ${colorsQuantityCubit.state.colorsQuantity}',
//                 style: TextStyle(
//                     color: const Color.fromARGB(255, 0, 180, 220),
//                     fontFamily: 'Block',
//                     fontSize: 18),
//               );
//             }),
//           ]),
//         );
//       }),
//     );
//   }
// }

// class Logo extends StatelessWidget {
//   const Logo({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Image.asset(
//       'assets/images/logo.png',
//       height: 60,
//     );
//   }
// }

// class GoButton extends StatelessWidget {
//   const GoButton({
//     super.key,
//     required TextEditingController figuresQuantityController,
//   }) : _figuresQuantityController = figuresQuantityController;

//   final TextEditingController _figuresQuantityController;

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//               side: BorderSide(width: 2, color: Colors.white)),
//           backgroundColor: Color.fromARGB(255, 100, 150, 0),
//           disabledBackgroundColor: Color.fromARGB(255, 0, 25, 50),
//           textStyle: TextStyle(color: Colors.white)),
//       onPressed: () {
//         final figuresQuantity =
//             int.tryParse(_figuresQuantityController.text) ?? 1;
//         BlocProvider.of<FiguresQuantityCubit>(context)
//             .setFiguresQuantity(figuresQuantity);

//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => ResultPage()));
//       },
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
//         child: Text(
//           'ВПЕРЕД',
//           style: Theme.of(context).textTheme.bodyMedium,
//         ),
//       ),
//     );
//   }
// }

// class NumericalInterval extends StatelessWidget {
//   const NumericalInterval({
//     super.key,
//     required this.textTheme,
//   });

//   final TextTheme textTheme;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       textAlign: TextAlign.center,
//       'Укажи число от 1 до 99',
//       style: textTheme.titleLarge,
//     );
//   }
// }

// class FiguresQuantityField extends StatelessWidget {
//   const FiguresQuantityField({
//     super.key,
//     required TextEditingController figuresQuantityController,
//   }) : _figuresQuantityController = figuresQuantityController;

//   final TextEditingController _figuresQuantityController;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 180,
//       child: TextField(
//         maxLength: 2,
//         inputFormatters: <TextInputFormatter>[
//           FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
//         ],
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           labelText: 'Количество фигур',
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }

// class HelloText extends StatelessWidget {
//   const HelloText({
//     super.key,
//     required this.textTheme,
//     required this.user,
//   });

//   final TextTheme textTheme;
//   final User user;

//   @override
//   Widget build(BuildContext context) {
//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         children: [
//           TextSpan(
//             text: 'Отлично,\n',
//             style: textTheme.titleLarge,
//           ),
//           TextSpan(
//             text: user.email ?? '',
//             style: textTheme.titleMedium,
//           ),
//           TextSpan(
//             text: '\n ',
//             style: TextStyle(fontSize: 10),
//           ),
//           TextSpan(
//             text: '\nТеперь давай определимся,\nсколько фигур мы нарисуем',
//             style: textTheme.titleLarge,
//           ),
//         ],
//       ),
//     );
//   }
// }



