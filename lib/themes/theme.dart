import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart';

CupertinoThemeData buildThemeData() {
  return CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 0, 0, 0),
    primaryContrastingColor: Colors.green,
    barBackgroundColor: const Color.fromARGB(255, 225, 169, 0),
    scaffoldBackgroundColor: const CupertinoDynamicColor.withBrightness(
      color: Color.fromARGB(255, 245, 245, 245),
      darkColor: Color.fromARGB(255, 68, 48, 0),
    ),
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
    "activeColor": const Color.fromARGB(255, 255, 255, 255),
    "inactiveColor": const Color.fromARGB(255, 255, 235, 124),
    "borderSideColor": const Color.fromARGB(255, 211, 179, 0),
  },
  "AnimatedSplashScreen": {
    "backgroundColor": const Color.fromARGB(255, 213, 167, 0),
  },
  "UserContentFooterActions": {
    "IconColor": Colors.black26,
  },
  "Skeleton": {"backgroundColor": Colors.black.withOpacity(0.04)},
  "UserContentFooter": {
    "ClickableTag": {"TextColor": Colors.black38}
  },
  "UserContent": {
    "CircleAvatar": {
      "backgroundColor": Colors.black12,
      "textColor": Colors.black54
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
          color: const Color.fromARGB(129, 0, 0, 0),
          fontStyle: FontStyle.italic);
    case "timeagoTextStyle":
      return DefaultTextStyle.of(context).style.apply(
            fontSizeFactor: (AppSettings.fontSizeFactor * 0.7),
            color: const CupertinoDynamicColor.withBrightness(
                color: Colors.black, darkColor: Colors.white),
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
