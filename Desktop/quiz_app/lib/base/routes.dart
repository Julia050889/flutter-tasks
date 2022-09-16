import 'package:flutter/material.dart';
import '../pages/auth/login/login.dart';
import '../pages/feedback/feedback_page.dart';
import '../pages/home/home_page.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const feedback = '/feedback';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPage(),
      AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.feedback: (context) => const FeedBack()
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
