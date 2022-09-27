import 'package:flutter/cupertino.dart';
import 'package:quiz_app/api/indigo_api.dart';
import 'package:quiz_app/models/setting/setting_model.dart';

class SettingPageProvider extends ChangeNotifier {
  SettingPageProvider() {
    getData();
  }
  bool isLoading = true;
  List<SettingModel> settings = [];

  getData() async {
    isLoading = true;
    final result = await IndigoAPI().settings.getSettingData();
    isLoading = false;
    settings = result;
    notifyListeners();
  }

  onChange(ind, val) {
    settings[ind].settingValue = val;
    notifyListeners();
  }
}
