import 'package:flutter/material.dart';
import 'package:quiz_app/pages/setting/setting_page_provider.dart';
import 'package:provider/provider.dart';

class SettingPageWidget extends StatefulWidget {
  const SettingPageWidget({super.key});

  @override
  State<SettingPageWidget> createState() => _SettingPageWidgetState();
}

class _SettingPageWidgetState extends State<SettingPageWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingPageProvider>(
        create: (context) => SettingPageProvider(),
        child: Consumer<SettingPageProvider>(
            builder: ((context, provider, child) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Settings"),
                    centerTitle: true,
                  ),
                  body: provider.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : _buildBody(context, provider),
                ))));
  }

  Widget _buildBody(BuildContext context, provider) {
    return ListView.separated(
      itemCount: provider.settings.length,
      separatorBuilder: (context, index) => const Divider(height: 0),
      itemBuilder: (context, index) {
        bool isSwitched = provider.settings[index].settingValue == true;
        return SwitchListTile(
            title: Text(provider.settings[index].settingName),
            value: isSwitched,
            onChanged: (value) => provider.onChange(index, value));
      },
    );
  }
}
