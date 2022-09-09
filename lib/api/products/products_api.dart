import 'package:dio/dio.dart';

import '../../models/product_model.dart';

class ProductsApi {
  final Dio appDioClient;

  ProductsApi(
    this.appDioClient,
  );

  // Future postData() async {
  //   Dio dio = Dio();
  //   var data = {
  //     'productName': 'Shalvar',
  //     'productPrice': 25,
  //     'isAvailable': true,
  //     'Materials': ['cotton']
  //   };

  //   var response = await dio
  //       .post(
  //         'https://my-json-server.typicode.com/narekpog/my-json/products',
  //         data: data,
  //         options: Options(
  //           method: 'POST',
  //           headers: {
  //             'Content-type': 'application/json; charset=UTF-8',
  //           },
  //         ),
  //       )
  //       .then((value) => value);
  //   return response.data;
  // }

  Future<List<ProductModel>> getProductsData() async {
    List<ProductModel> products = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/products',
    );

    if (result.data is List) {
      products = result.data.first
          .map<ProductModel>(
            (e) => ProductModel.fromJson(e),
          )
          .toList();
    }

    return products;
  }
}
