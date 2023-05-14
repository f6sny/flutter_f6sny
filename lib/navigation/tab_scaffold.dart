import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/screens/search.dart';
import 'package:flutter_f6sny/screens/settings.dart';
import 'package:flutter_f6sny/screens/tags.dart';
import '../screens/home.dart';
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
              return const Home();
            case 1:
              return const Search();
            case 2:
              return const Tags();
            case 3:
              return const Settings();
            default:
              return const Home();
          }
        }));
  }
}
