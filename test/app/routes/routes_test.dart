// import 'package:colorful_figures/app/bloc/app_bloc.dart';
// import 'package:colorful_figures/app/routes/routes.dart';
// import 'package:colorful_figures/colors_quontity/view/colors_quontity_page.dart';
// import 'package:colorful_figures/login/view/login_page.dart';
// import 'package:flutter/material.dart';

// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('onGenerateAppViewPages', () {
//     test('returns [HomePage] when authenticated', () {
//       expect(
//         onGenerateAppViewPages(AppStatus.authenticated, []),
//         [
//           isA<MaterialPage<void>>().having(
//             (p) => p.child,
//             'child',
//             isA<HomePage>(),
//           ),
//         ],
//       );
//     });

//     test('returns [LoginPage] when unauthenticated', () {
//       expect(
//         onGenerateAppViewPages(AppStatus.unauthenticated, []),
//         [
//           isA<MaterialPage<void>>().having(
//             (p) => p.child,
//             'child',
//             isA<LoginPage>(),
//           ),
//         ],
//       );
//     });
//   });
// }
