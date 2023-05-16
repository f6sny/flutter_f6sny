import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const keyDarkMode = 'key-dark-mode';
  static const keySafeMode = 'key-safe-mode';
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
          child: ListView(
        children: [
          SettingsGroup(
              title: "General",
              children: <Widget>[buildDarkMode(), buildSafeMode()])
        ],
      )),
    );
  }

  Widget buildSafeMode() => DropDownSettingsTile(
      title: "Safe Mode",
      settingKey: keySafeMode,
      leading: const IconWidget(
          color: Color.fromARGB(255, 213, 46, 243), icon: Icons.lock),
      selected: 1,
      values: {0: "Strict", 1: "Moderate", 2: "Open"});

  Widget buildDarkMode() => SwitchSettingsTile(
        title: "Dark Mode",
        settingKey: keyDarkMode,
        leading:
            const IconWidget(color: Color(0xFF642ef3), icon: Icons.dark_mode),
      );
}

class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  const IconWidget({super.key, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
