import 'package:flutter/material.dart';
import '../../api/indigo_api.dart';
import '../../models/setting_model.dart';

class SettingPageWidget extends StatefulWidget {
  const SettingPageWidget({super.key});

  @override
  State<SettingPageWidget> createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  bool showf = false;
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return FutureBuilder(
      future: IndigoAPI().settings.getSettingData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final settings = snapshot.data as List<SettingModel>;

          return ListView.separated(
            itemCount: settings.length,
            separatorBuilder: (context, index) => const Divider(height: 0),
            itemBuilder: (context, index) {
              return SwitchListTile(
                  title: Text(settings[index].settingName.toString()),
                  value: settings[index].settingValue,
                  onChanged: (value) {
                    setState(() {
                      settings[index].settingValue = value;
                    });
                  });
            },
          );
        } else {
          return const Center(
            child: Text('No Items'),
          );
        }
      },
    );
  }
}
