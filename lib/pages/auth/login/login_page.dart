import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_app/base/reg_exp.dart';
import 'package:flutter_app/base/route.dart';
import 'package:flutter_app/pages/auth/login/login_widgets/field.dart';
import 'package:flutter_app/pages/auth/login/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(),
        child: Scaffold(
            body: Container(
          color: Colors.amberAccent,
          width: double.infinity,
          height: double.infinity,
          child: _loginField(),
        )));
  }

  Widget _loginField() {
    return Consumer<LoginProvider>(
        builder: ((context, value, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Log In'),
                field(),
                ElevatedButton(
                  child: const Text('Log In'),
                  onPressed: () {
                    value.onLogin(context);
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      value.onFocusFields(context);
                    },
                    child: Text('Focus Textfields'))
              ],
            )));
  }

  // Widget field() {
  //   return Consumer<LoginProvider>(
  //       builder: ((context, value, child) => Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 20),
  //           child: Column(
  //             children: [
  //               TextField(
  //                 controller: value.usernameCtrl,
  //                 decoration: InputDecoration(
  //                   //icon: Icon(Icons.email),
  //                   suffixIcon: value.usernameCtrl.text.isEmpty
  //                       ? Container(
  //                           width: 0,
  //                         )
  //                       : IconButton(
  //                           icon: Icon(Icons.close),
  //                           onPressed: () {
  //                             value.onClearEmail();
  //                           },
  //                         ),
  //                   labelText: 'Email',
  //                   hintText: 'Enter your email',
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15),
  //                   ),
  //                 ),
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               TextField(
  //                 obscureText: true,
  //                 decoration: InputDecoration(
  //                   labelText: 'Password',
  //                   hintText: 'Enter your password',
  //                   border: OutlineInputBorder(
  //                     borderRadius: BorderRadius.circular(15),
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ))));
}

  // void onLogin(provider, BuildContext context) {
  //   final regexp = RegExp(RegularExpressions.username);
  //   if (provider.usernameCtrl.text.isNotEmpty ||
  //       provider.passwordCtrl.text.isNotEmpty) {
  //     if (regexp.hasMatch(provider.usernameCtrl.text)) {
  //       Navigator.pushNamed(context, AppRoutes.homepage);
  //     }
  //   } else {}
  // }

  // Widget onLogin() {
  //  return Consumer<LoginProvider>(builder: (context, value, child) =>
  //     Text(''),
  //   );
  // }

