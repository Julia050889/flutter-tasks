import 'package:flutter/material.dart';
import 'package:flutter_app/base/route.dart';
import 'package:flutter_app/pages/auth/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Population',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPageWidget(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
