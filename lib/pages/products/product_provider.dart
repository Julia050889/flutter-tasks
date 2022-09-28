import 'package:flutter/material.dart';
import 'package:quiz_app/api/indigo_api.dart';
import 'package:quiz_app/models/products/product_model.dart';

class ProductPageProvider extends ChangeNotifier {
  bool changeView = true;
  bool isLoading = false;
  List<ProductModel> products = [];

  ProductPageProvider() {
    getProductData();
  }

  getProductData() async {
    isLoading = true;
    notifyListeners();
    final result = await IndigoAPI().products.getProductsData();

    if (result.isNotEmpty) {
      isLoading = false;
      products = result;
      notifyListeners();
    }
    return products;
  }

  void onChangeIcon() {
    changeView = !changeView;
    notifyListeners();
  }
}
