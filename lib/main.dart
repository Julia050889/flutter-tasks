import 'package:flutter/material.dart';
import 'pages/flutter_tasks/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MyApp',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
