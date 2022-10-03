import 'package:dio/dio.dart';
import 'package:flutter_app/models/product_model.dart';

class ProductApi {
  final Dio appDioClient;

  ProductApi(
    this.appDioClient,
  );

  Future<ProductModel> getProductData() async {
    ProductModel productdata;

    final result = await appDioClient.get(
      'https://dummyjson.com/products',
    );

    var res = result.data as Map<String, dynamic>;
    productdata = ProductModel.fromJson(res);
    return productdata;
  }

  // Future<List<Question>> getQuestionsData() async {
  //   List<Question> questions = [];

  //   final result = await appDioClient.get(
  //     'https://my-json-server.typicode.com/narekpog/my-json/feedback',
  //   );

  //   var res = result.data as Map<String, dynamic>;

  //   questions = res['questions']
  //       .map<Question>(
  //         (e) => Question.fromJson(e),
  //       )
  //       .toList();
  //   return questions;
  // }
}
