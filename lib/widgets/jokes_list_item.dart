import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:timeago/timeago.dart' as timeago;

class JokesListItem extends StatelessWidget {
  final joke;

  const JokesListItem({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(constants.spacingFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              joke.content,
              style: DefaultTextStyle.of(context).style.apply(
                    fontSizeFactor: constants.fontSizeFactor,
                  ),
            ),
            const SizedBox(
              height: constants.spacingFactor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "بواسطة ${joke.author}, ${timeago.format(joke.modifiedAt, locale: 'ar')}",
                  style: DefaultTextStyle.of(context).style.apply(
                        fontSizeFactor: (constants.fontSizeFactor * 0.7),
                        color: Colors.black38,
                      ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
