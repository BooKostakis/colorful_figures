import 'package:flutter/widgets.dart';
import 'package:colorful_figures/app/app.dart';
import 'package:colorful_figures/colors_quontity/colors_quontity.dart';
import 'package:colorful_figures/login/login.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [ColorsQuontityPage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
