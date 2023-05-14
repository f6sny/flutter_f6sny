import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SharedPreferences prefs;

  bool _isDarkModeEnabled = false;
  SafeSearchOption _selectedSafeSearchOption = SafeSearchOption.strict;

  void _toggleDarkMode(bool value) {
    setState(() {
      _isDarkModeEnabled = value;
    });
    // Apply dark mode/light mode settings
    // You can use a theme provider or set the theme globally here
  }

  void _changeSafeSearchOption(int selectedIndex) {
    setState(() {
      _selectedSafeSearchOption = SafeSearchOption.values[selectedIndex];
    });
  }

  void _increaseFontSize() {
    setState(() {
      updateFontSize(AppSettings.fontSize + 2.0);
    });
  }

  void _decreaseFontSize() {
    setState(() {
      updateFontSize(AppSettings.fontSize - 2.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    addDefaultValueToSharedPreferences();
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
        child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
                  thickness: 1.0,
                  color: Colors.grey,
                ),
            itemCount: 3,
            itemBuilder: (context, index) {
              switch (index) {
                case 0:
                  return CupertinoListTile(
                    padding: const EdgeInsets.all(16),
                    title: const Text('Dark Mode'),
                    trailing: CupertinoSwitch(
                      value: _isDarkModeEnabled,
                      onChanged: _toggleDarkMode,
                    ),
                  );
                case 1:
                  return CupertinoListTile(
                    padding: const EdgeInsets.all(16),
                    title: const Text('Safe Search'),
                    trailing: CupertinoTheme(
                      data: CupertinoThemeData(
                        brightness: _isDarkModeEnabled
                            ? Brightness.dark
                            : Brightness.light,
                      ),
                      child: Container(
                        width: 150.0,
                        child: CupertinoPicker(
                          itemExtent: 32.0,
                          onSelectedItemChanged: _changeSafeSearchOption,
                          children: SafeSearchOption.values
                              .map((option) => Text(
                                    option.toString().split('.').last,
                                    style: const TextStyle(fontSize: 16.0),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  );
                case 2:
                  return CupertinoListTile(
                    padding: const EdgeInsets.all(16),
                    title: const Text('Font Size'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: _decreaseFontSize,
                          child: const Icon(Icons.remove),
                        ),
                        const SizedBox(width: 4.0),
                        FutureBuilder<double>(
                          future: getFontSize(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final fontSize = snapshot.data!;
                              return Text(
                                fontSize.toString(),
                                style: TextStyle(fontSize: fontSize),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          },
                        ),
                        const SizedBox(width: 4.0),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: _increaseFontSize,
                          child: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  );
                default:
                  return const SizedBox.shrink();
              }
            }),
      ),
    );
  }
}

enum SafeSearchOption {
  strict,
  moderate,
  off,
}

void addDefaultValueToSharedPreferences() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.setDouble('fontsize', 16.0);
}

Future<double> getFontSize() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.getDouble('fontsize') ?? 16.0;
}

Future<bool> updateFontSize(double updatedSize) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  return await prefs.setDouble('fontsize', updatedSize);
}
