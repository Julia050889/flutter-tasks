import 'package:dio/dio.dart';
import 'package:flutter_app/api/product/product_api.dart';

class IndigoAPI {
  static IndigoAPI? _singleton;

  late ProductApi products;

  Dio appDioClient = Dio();

  factory IndigoAPI() {
    _singleton ??= IndigoAPI._internal();
    return _singleton!;
  }

  IndigoAPI._internal() {
    // Init subclasses
    products = ProductApi(appDioClient);
  }
}
