import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:flutter_f6sny/themes/theme.dart';
import 'package:share_plus/share_plus.dart';

import '../../screens/joke.dart';

class UserContentFooterActions extends StatelessWidget {
  final dynamic joke;

  const UserContentFooterActions({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Icon(CupertinoIcons.share,
              color: myColors["UserContentFooterActions"]["IconColor"],
              size: 18),
          onTap: () async {
            await Share.share(joke["content"]);
          },
        ),
        Row(
          children: [
            Icon(CupertinoIcons.heart,
                color: myColors["UserContentFooterActions"]["IconColor"],
                size: 18),
            SizedBox(
              width: AppSettings.spacingFactor,
            ),
            Text(
              "5",
              style: DefaultTextStyle.of(context).style.apply(
                  color: myColors["UserContentFooterActions"]["IconColor"],
                  fontSizeDelta: 2),
            ),
          ],
        ),
        GestureDetector(
          child: Icon(CupertinoIcons.chat_bubble,
              color: myColors["UserContentFooterActions"]["IconColor"],
              size: 18),
          onTap: () async {
            Navigator.push(
              context,
              CupertinoPageRoute(
                title: "joke",
                maintainState: true,
                builder: (context) => Joke(joke: joke),
              ),
            );
          },
        )
      ],
    );
  }
}
