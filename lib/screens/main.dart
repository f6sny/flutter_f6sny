import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/screens/search.dart';
import 'package:flutter_f6sny/screens/settings.dart';
import 'package:flutter_f6sny/screens/tags.dart';
import 'home.dart';

class Main extends StatefulWidget {
  const Main({super.key, required this.title});

  final String title;

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            inactiveColor: const Color.fromARGB(255, 214, 182, 0),
            border: const Border(
                top: BorderSide(
                    color: Color.fromARGB(255, 211, 179, 0), width: 1)),
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
