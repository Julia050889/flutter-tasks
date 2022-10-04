import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/indigo_api.dart';
import 'package:flutter_app/models/product_model.dart';
import 'package:flutter_app/pages/auth/login/login_page.dart';
import 'package:flutter_app/pages/product/product_page.dart';

class HomePageProvider extends ChangeNotifier {
  HomePageProvider() {}
  int currentIndex = 0;
  List pages = [
    Center(child: Text('Bottom NavigatorBar')),
    ProductPageWidget(),
    LoginPageWidget(),
    ProductPageWidget()
  ];

  void onChangeIndex(index) {
    currentIndex = index;
    notifyListeners();
  }
}
