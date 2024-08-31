import 'package:flutter/widgets.dart';
import 'package:colorful_figures/app/app.dart';
import 'package:colorful_figures/home/home.dart';
import 'package:colorful_figures/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
