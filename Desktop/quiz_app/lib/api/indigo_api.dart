import 'package:dio/dio.dart';
import 'package:quiz_app/api/products/products_api.dart';
import 'package:quiz_app/api/setting/setting_api.dart';

import 'feedback/feedback_api.dart';

class IndigoAPI {
  static IndigoAPI? _singleton;

  late ProductsApi products;
  late FeedbackApi feedback;
  late SettingApi settings;
  Dio appDioClient = Dio();

  factory IndigoAPI() {
    if (_singleton == null) {
      _singleton = IndigoAPI._internal();
    }
    return _singleton!;
  }

  IndigoAPI._internal() {
    // Init subclasses
    products = ProductsApi(appDioClient);
    settings = SettingApi(appDioClient);
    feedback = FeedbackApi(appDioClient);
  }
}
