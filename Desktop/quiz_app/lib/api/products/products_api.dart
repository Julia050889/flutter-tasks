import 'package:dio/dio.dart';
import 'package:quiz_app/models/products/product_model.dart';

class ProductsApi {
  final Dio appDioClient;

  ProductsApi(
    this.appDioClient,
  );

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
