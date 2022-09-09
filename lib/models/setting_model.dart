class SettingModel {
  final int? id;
  final String? settingName;
  bool settingValue;
  SettingModel({
    this.id,
    this.settingName,
    required this.settingValue,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) => SettingModel(
        id: json["id"],
        settingName: json["setting_name"],
        settingValue: json["setting_value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "setting_name": settingName,
        "setting_value": settingValue,
      };
}
