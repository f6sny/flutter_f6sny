// import 'package:flutter/material.dart';
// import '../constants.dart' as constants;
// import '../screens/home.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// class BottomNavigationMenu extends StatefulWidget {
//   final int selectedIndex;

//   const BottomNavigationMenu({Key? key, required this.selectedIndex})
//       : super(key: key);

//   @override
//   State<BottomNavigationMenu> createState() => _BottomNavigationMenu();
// }

// class _BottomNavigationMenu extends State<BottomNavigationMenu> {
//   late int _selectedIndex;

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.selectedIndex;
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.pushReplacementNamed(context, '/home');
//         break;
//       case 1:
//         Navigator.pushReplacementNamed(context, '/about');
//         break;
//     }
//   }

//   final screens = [
//     const Home(
//       title: 'آخر النكت',
//     )
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return NavigationBarTheme(
//         data: NavigationBarThemeData(
//           //indicatorColor: Colors.red,
//           labelTextStyle: MaterialStateProperty.all(const TextStyle(
//               fontSize: constants.fontSize,
//               fontWeight: FontWeight.w500,
//               color: Colors.blue)),
//           //backgroundColor: Colors.yellow
//         ),
//         child: NavigationBar(
//             selectedIndex: _selectedIndex,
//             onDestinationSelected: _onItemTapped,
//             backgroundColor: Colors.transparent,
//             destinations: [
//               NavigationDestination(
//                   icon: const Icon(Icons.home),
//                   label: AppLocalizations.of(context)!.homePageTitle),
//               NavigationDestination(
//                   icon: const Icon(Icons.more),
//                   label: AppLocalizations.of(context)!.morePageTitle),
//             ]));
//   }
// }
