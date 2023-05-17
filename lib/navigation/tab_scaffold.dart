import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/screens/search_page.dart';
import 'package:flutter_f6sny/screens/settings_page.dart';
import 'package:flutter_f6sny/screens/tags_page.dart';
import '../screens/home_page.dart';
import '../themes/theme.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            height: 60,
            backgroundColor: myColors["CupertinoTabBarColors"]
                ["backgroundColor"],
            activeColor: myColors["CupertinoTabBarColors"]["activeColor"],
            inactiveColor: myColors["CupertinoTabBarColors"]["inactiveColor"],
            border: Border(
                top: BorderSide(
                    color: myColors["CupertinoTabBarColors"]["borderSideColor"],
                    width: 1)),
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.tag),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
              ),
            ]),
        tabBuilder: ((context, index) {
          switch (index) {
            case 0:
              return const HomePage();
            case 1:
              return SearchPage();
            case 2:
              return const TagsPage();
            case 3:
              return const SettingsPage();
            default:
              return const HomePage();
          }
        }));
  }
}
