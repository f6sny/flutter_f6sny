import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/screens/search.dart';
import 'package:flutter_f6sny/screens/settings.dart';
import 'package:flutter_f6sny/screens/tags.dart';
import '../screens/home.dart';

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
            activeColor: Color.fromARGB(255, 255, 255, 255),
            inactiveColor: Color.fromARGB(255, 255, 235, 124),
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
