import 'package:dio/dio.dart';
import '../../models/setting/setting_model.dart';

class SettingApi {
  final Dio appDioClient;

  SettingApi(
    this.appDioClient,
  );

  Future<List<SettingModel>> getSettingData() async {
    List<SettingModel> settings = [];

    final result = await appDioClient.get(
      'https://my-json-server.typicode.com/narekpog/my-json/settings',
    );

    if (result.data is List) {
      settings = result.data
          .map<SettingModel>(
            (e) => SettingModel.fromJson(e),
          )
          .toList();
    }

    return settings;
  }
}
