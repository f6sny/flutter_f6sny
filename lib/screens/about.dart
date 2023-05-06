import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_menu.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavigationMenu(selectedIndex: 1),
        appBar: AppBar(
          title: const Text(
            "مزيد",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: Column(
          children: const [Text("Testing")],
        ));
  }
}
