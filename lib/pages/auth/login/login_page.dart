import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../base/reg_exp.dart';
import '../../../base/route.dart';
import 'login_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: LoginStyles.mainColor.withOpacity(0.8),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _fields(context),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.grey[600],
                primary: Colors.grey[100],
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              ),
              onPressed: () {
                _onLogin(context);
              },
              child: const Text(
                'Log In',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fields(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      padding: const EdgeInsets.only(
        right: 25,
        left: 25,
        top: 40,
        bottom: 50,
      ),
      child: Column(
        children: [
          Text(
            'Log In'.toUpperCase(),
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
              color: LoginStyles.mainColor,
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: usernameCtrl,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: passwordCtrl,
            obscureText: !showPassword,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                onPressed: _onShowPassword,
                icon: showPassword
                    ? const Icon(
                        Icons.visibility,
                      )
                    : const Icon(
                        Icons.visibility_off,
                      ),
              ),
              border: const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dialog(
    context, {
    required String title,
    String? content,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Text(content ?? 'Some of the credentials are empty'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  void _onLogin(context) {
    final regExp = RegExp(RegularExpressions.email);
    final regExpPass = RegExp(RegularExpressions.password);

    Navigator.of(context).pushReplacementNamed(AppRoutes.homepage);
    return;
    if (usernameCtrl.text.isNotEmpty && passwordCtrl.text.isNotEmpty) {
      if (regExp.hasMatch(usernameCtrl.text) &&
          regExpPass.hasMatch(passwordCtrl.text)) {
        Navigator.of(context).pushReplacementNamed(AppRoutes.homepage);
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return _dialog(
              context,
              title: 'Error',
              content: 'Username is invalid',
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return _dialog(
            context,
            title: 'Error',
            content: 'Some of the credentials are empty',
          );
        },
      );
    }
  }

  void _onShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }
}
