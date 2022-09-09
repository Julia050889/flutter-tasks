import 'package:flutter/material.dart';
import '../pages/auth/login/login_page.dart';
import '../pages/homepage/home_page.dart';
import '../pages/setting_page/setting_page.dart';

class AppRoutes {
  static const login = '/';
  static const homepage = '/homepage';
  static const settingpage = '/settingpage';

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    PageArguments? pageArguments;
    if (settings.arguments != null) {
      pageArguments = (settings.arguments as PageArguments);
    }

    var routes = <String, WidgetBuilder>{
      AppRoutes.login: (context) => const LoginPage(),
      AppRoutes.homepage: (context) => const HomePageWidget(),
      AppRoutes.settingpage: (context) => const SettingPageWidget(),
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
