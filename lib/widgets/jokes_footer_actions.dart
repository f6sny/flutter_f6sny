import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

class JokesFooterActions extends StatelessWidget {
  const JokesFooterActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(CupertinoIcons.share, color: Colors.black26, size: 18),
        Row(
          children: const [
            Icon(CupertinoIcons.heart, color: Colors.black26, size: 18),
            SizedBox(
              width: constants.spacingFactor,
            ),
            Text(
              "5",
              style:
                  TextStyle(inherit: true, color: Colors.black26, fontSize: 18),
            ),
          ],
        ),
        const Icon(CupertinoIcons.chat_bubble, color: Colors.black26, size: 18),
      ],
    );
  }
}
