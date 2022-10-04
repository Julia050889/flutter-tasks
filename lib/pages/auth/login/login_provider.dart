import 'package:flutter/cupertino.dart';
import 'package:flutter_app/base/reg_exp.dart';
import 'package:flutter_app/base/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/auth/login/login_widgets/dialog.dart';

class LoginProvider extends ChangeNotifier {
  LoginProvider() {
    usernameCtrl.addListener(() {
      notifyListeners();
    });
  }
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final node = FocusNode();

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
    final regexp = RegExp(RegularExpressions.email);

    Navigator.of(context).pushReplacementNamed(AppRoutes.homepage);
    return;

    if (usernameCtrl.text.isNotEmpty || passwordCtrl.text.isNotEmpty) {
      if (regexp.hasMatch(usernameCtrl.text)) {
        Navigator.pushNamed(context, AppRoutes.homepage);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return dialog(context,
                  title: 'Error', content: 'Invalid Textfield');
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return dialog(context,
                title: 'Error', content: 'One of textfield is empty');
          });
    }
  }

  onFocusFields(BuildContext context) {
    FocusScope.of(context).requestFocus(node);
  }
}
