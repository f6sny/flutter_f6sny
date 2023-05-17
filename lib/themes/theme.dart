import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart';

CupertinoThemeData buildThemeData(bool isDarkMode) {
  return CupertinoThemeData(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    primaryColor: const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 0, 0, 0),
        darkColor: Color.fromARGB(255, 255, 255, 255)),
    primaryContrastingColor: Colors.green,
    barBackgroundColor: const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 211, 179, 0),
        darkColor: Color.fromARGB(255, 0, 3, 156)),
    scaffoldBackgroundColor: const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 255, 255, 255),
        darkColor: Color.fromARGB(255, 0, 25, 74)),
    textTheme: CupertinoTextThemeData(
      primaryColor: Colors.pink,
      textStyle: const TextStyle(
          color: CupertinoDynamicColor.withBrightness(
            color: Colors.black,
            darkColor: Colors.white,
          ),
          fontSize: 16,
          fontWeight: FontWeight.w100),
      actionTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: AppSettings.fontSize,
          fontWeight: FontWeight.w100),
      tabLabelTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: AppSettings.fontSize * 2,
          fontWeight: FontWeight.w100),
      navTitleTextStyle: TextStyle(
          color: const Color.fromARGB(255, 255, 255, 255),
          fontSize: AppSettings.fontSize * 1.2,
          fontWeight: FontWeight.w100),
      navLargeTitleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: AppSettings.fontSize * 1.4,
          fontWeight: FontWeight.w100),
      navActionTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: AppSettings.fontSize,
          fontWeight: FontWeight.w100),
      pickerTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: AppSettings.fontSize,
          fontWeight: FontWeight.w100),
      dateTimePickerTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: AppSettings.fontSize,
          fontWeight: FontWeight.w100),
    ),
  );
}

Map<String, dynamic> myColors = {
  "CupertinoTabBarColors": {
    "backgroundColor": const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 211, 179, 0),
        darkColor: Color.fromARGB(255, 0, 3, 156)),
    "activeColor": const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 255, 255, 255),
        darkColor: Color.fromARGB(255, 255, 255, 255)),
    "inactiveColor": const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 255, 208, 0),
        darkColor: Color.fromARGB(255, 62, 32, 255)),
    "borderSideColor": const CupertinoDynamicColor.withBrightness(
        color: Color.fromARGB(255, 211, 179, 0),
        darkColor: Color.fromARGB(255, 0, 3, 156)),
  },
  "AnimatedSplashScreen": {
    "backgroundColor": const Color.fromARGB(255, 213, 167, 0),
  },
  "UserContentFooterActions": {
    "IconColor": const CupertinoDynamicColor.withBrightness(
        color: Colors.black26, darkColor: Colors.white),
  },
  "Skeleton": {"backgroundColor": Colors.black.withOpacity(0.04)},
  "UserContentFooter": {
    "ClickableTag": {"TextColor": Colors.black38}
  },
  "UserContent": {
    "CircleAvatar": {
      "backgroundColor": const CupertinoDynamicColor.withBrightness(
          color: Colors.yellowAccent, darkColor: Colors.green),
      "textColor": const CupertinoDynamicColor.withBrightness(
          color: Colors.black87, darkColor: Colors.white60)
    }
  },
  "JokesPageCommentsArea": {
    "title": {"textColor": Colors.black}
  }
};

TextStyle myTextStyles(context, field) {
  switch (field) {
    case "fullnameTextStyle":
      return DefaultTextStyle.of(context).style.apply(
            fontSizeFactor: (AppSettings.fontSizeFactor * 0.7),
          );
    case "usernameTextStyle":
      return DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: (AppSettings.fontSizeFactor * 0.7),
          color: CupertinoDynamicColor.resolve(
              CupertinoDynamicColor.withBrightness(
                  color: Color.fromARGB(255, 2, 2, 2),
                  darkColor: Color.fromARGB(255, 255, 255, 255)),
              context),
          fontStyle: FontStyle.italic);
    case "timeagoTextStyle":
      return DefaultTextStyle.of(context).style.apply(
            fontSizeFactor: (AppSettings.fontSizeFactor * 0.7),
            color: CupertinoDynamicColor.resolve(
                CupertinoDynamicColor.withBrightness(
                    color: Color.fromARGB(255, 2, 2, 2),
                    darkColor: Color.fromARGB(255, 255, 255, 255)),
                context),
          );
    case "commentsTitleStyle":
      return DefaultTextStyle.of(context).style.apply(
            fontSizeFactor: (AppSettings.fontSizeFactor * 1.2),
            fontWeightDelta: 4,
            color: Colors.black87,
          );
    default:
      return DefaultTextStyle.of(context).style;
  }
}
