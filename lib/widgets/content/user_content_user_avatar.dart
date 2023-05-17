import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants.dart';
import '../../themes/theme.dart';

class UserAvatar extends StatefulWidget {
  final dynamic content;

  const UserAvatar({super.key, required this.content});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  @override
  Widget build(BuildContext context) {
    String userInitials = widget.content["author"]["username"]
        .toString()
        .substring(0, 2)
        .toUpperCase();

    if (widget.content["author"]["display_picture"] == null) {
      return CircleAvatar(
        backgroundColor: CupertinoDynamicColor.resolve(
            myColors["UserContent"]["CircleAvatar"]["backgroundColor"],
            context),
        radius: 26,
        child: Text(userInitials,
            style: DefaultTextStyle.of(context).style.apply(
                fontWeightDelta: 2,
                color: CupertinoDynamicColor.resolve(
                    myColors["UserContent"]["CircleAvatar"]["textColor"],
                    context),
                fontSizeFactor: 1.2)),
      );
    }
    String avatarURL = AppSettings.baseUrl +
        widget.content["author"]["display_picture"]["formats"]["thumbnail"]
            ["url"];
    return CircleAvatar(
      backgroundColor: CupertinoDynamicColor.resolve(
          myColors["UserContent"]["CircleAvatar"]["backgroundColor"], context),
      radius: 26,
      backgroundImage: NetworkImage(avatarURL),
    );
  }
}
