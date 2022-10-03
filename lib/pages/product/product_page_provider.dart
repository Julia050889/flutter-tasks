import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api/indigo_api.dart';

class ProductProvider extends ChangeNotifier {
  ProductProvider() {
    getData();
  }

  List data = [];
  var limit;
  
  bool isLoading = false;
  void getData() async {
    isLoading = true;
    final result = await IndigoAPI().products.getProductData();
    // populationModelData = result;
    isLoading = false;
    limit = result.limit;
    data = result.products;
    //print(data);
    // data = result.products;
    notifyListeners();
  }
}
