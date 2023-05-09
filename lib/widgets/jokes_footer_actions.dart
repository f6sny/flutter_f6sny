import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:share_plus/share_plus.dart';

import '../screens/joke.dart';

class JokesFooterActions extends StatelessWidget {
  final dynamic joke;

  const JokesFooterActions({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child:
              const Icon(CupertinoIcons.share, color: Colors.black26, size: 18),
          onTap: () async {
            await Share.share(joke["content"]);
          },
        ),
        Row(
          children: [
            const Icon(CupertinoIcons.heart, color: Colors.black26, size: 18),
            const SizedBox(
              width: constants.spacingFactor,
            ),
            Text(
              "5",
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(color: Colors.black26, fontSizeDelta: 2),
            ),
          ],
        ),
        GestureDetector(
          child: const Icon(CupertinoIcons.chat_bubble,
              color: Colors.black26, size: 18),
          onTap: () async {
            Navigator.push(
              context,
              CupertinoPageRoute(
                title: "Hala",
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
