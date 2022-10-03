import 'package:flutter/material.dart';
import 'package:flutter_app/pages/auth/login/login_page.dart';
import 'package:flutter_app/pages/auth/login/login_provider.dart';
import 'package:flutter_app/pages/home/home_page.dart';
import 'package:flutter_app/pages/product/product_page.dart';
import 'package:provider/provider.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const productpage = '/productspage';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPageWidget(),
      AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.productpage: (context) => const ProductPageWidget(),
    };

    WidgetBuilder builder = routes[settings.name] ?? routes.values.first;
    return MaterialPageRoute(builder: (ctx) => builder(ctx));
  }
}

class PageArguments {
  final String? pageTitle;
  final Map<String, dynamic>? data;

  PageArguments({
    this.pageTitle,
    this.data,
  });
}
