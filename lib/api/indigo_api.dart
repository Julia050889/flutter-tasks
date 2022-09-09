import 'package:new_project/api/products/products_api.dart';
import 'package:new_project/api/products/settings/setting_api.dart';
import 'package:dio/dio.dart';

class IndigoAPI {
  static IndigoAPI? _singleton;

  //late ProductsApi products;
  late SettingApi settings;
  late ProductsApi products;
  Dio appDioClient = Dio();

  factory IndigoAPI() {
    _singleton ??= _singleton = IndigoAPI._internal();

    return _singleton!;
  }

  IndigoAPI._internal() {
    // Init subclasses
    settings = SettingApi(appDioClient);
    products = ProductsApi(appDioClient);
  }
}
