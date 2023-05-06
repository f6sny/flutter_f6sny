import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/screens/about.dart';
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
            // onTap: (index) {
            //   print("$index clicked");
            // },
            inactiveColor: Color.fromARGB(255, 214, 182, 0),
            height: 70,
            iconSize: 30,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.settings), label: "Delete"),
            ]),
        tabBuilder: ((context, index) {
          switch (index) {
            case 0:
              return const Home();
            case 1:
              return const About();
            default:
              return const Home();
          }
        }));
  }
}
