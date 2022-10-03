import 'package:flutter/cupertino.dart';
import 'package:flutter_app/base/reg_exp.dart';
import 'package:flutter_app/base/route.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    usernameCtrl.addListener(() {
      notifyListeners();
    });
  }
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  bool showText = false;

  onShowText() {
    showText = !showText;
    notifyListeners();
  }

  void onClearEmail() {
    usernameCtrl.clear();
    notifyListeners();
  }

  void onLogin(BuildContext context) {
    final regexp = RegExp(RegularExpressions.username);
    if (usernameCtrl.text.isNotEmpty || passwordCtrl.text.isNotEmpty) {
      if (regexp.hasMatch(usernameCtrl.text)) {
        Navigator.pushNamed(context, AppRoutes.productpage);
      }
    } else {}
  }
}
