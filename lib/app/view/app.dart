import 'package:authentication_repository/authentication_repository.dart';
import 'package:colorful_figures/colors_quontity/cubit/colors_qountity_cubit.dart';
import 'package:colorful_figures/figures_quontity/cubit/figures_qountity_cubit.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:colorful_figures/app/app.dart';
import 'package:colorful_figures/theme.dart';

class App extends StatelessWidget {
  const App({
    required AuthenticationRepository authenticationRepository,
    super.key,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => FiguresQuantityCubit()),
          BlocProvider(create: (context) => ColorsQuantityCubit()),
          BlocProvider(
            lazy: false,
            create: (_) => AppBloc(
              authenticationRepository: _authenticationRepository,
            )..add(const AppUserSubscriptionRequested()),
          )
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
