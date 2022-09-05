// import 'package:first_project/pages/home_page.dart';
// import 'package:first_project/pages/products_page.dart';
// import 'package:first_project/pages/settings_page.dart';
// import 'package:flutter/material.dart';

// class AppRoutes {
//   static const home = '/';
//   static const settings = '/settings';
//   static const products = '/products';

//   static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
//     PageArguments? pageArguments;
//     if (settings.arguments != null) {
//       pageArguments = (settings.arguments as PageArguments);
//     }

//     var routes = <String, WidgetBuilder>{
//       AppRoutes.home: (context) => const HomePageWidget(),
//       AppRoutes.settings: (context) => SettingPage(
//             id: pageArguments?.data?['id'],
//           ),
//       AppRoutes.products: (context) => const ProductsPage(),
//     };

//     WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
//     return MaterialPageRoute(builder: (ctx) => builder(ctx));
//   }
// }
