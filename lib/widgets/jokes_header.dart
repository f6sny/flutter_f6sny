import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:namefully/namefully.dart';

class JokesHeader extends StatelessWidget {
  final String jokeUpdatedAt;
  final dynamic author;
  final bool stacked;
  const JokesHeader(
      {super.key,
      required this.author,
      required this.jokeUpdatedAt,
      this.stacked = false});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());

    var name = Namefully.only(
      firstName: author["first_name"],
      lastName: author["last_name"],
    );
    String timagoString = timeago.format(DateTime.parse(jokeUpdatedAt),
        locale: AppLocalizations.of(context)!.localeName);
    TextStyle usernameTextStyle = DefaultTextStyle.of(context).style.apply(
        fontSizeFactor: (constants.fontSizeFactor * 0.9),
        color: Colors.black38,
        fontStyle: FontStyle.italic);
    TextStyle timeagoTextStyle = DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: (constants.fontSizeFactor * 0.7),
          color: Colors.black38,
        );
    Widget stackedOrNot() {
      if (stacked) {
        return Column(
          children: [
            Text(name.full),
            Text(
              "@${author["username"]}",
              textDirection: TextDirection.ltr,
              style: usernameTextStyle,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      }
      return Row(
        children: [
          RichText(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              text: name.full,
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  locale: Locale('en'),
                  text: "@${author["username"]}",
                  style: usernameTextStyle,
                ),
                TextSpan(text: ". $timagoString", style: timeagoTextStyle),
              ],
            ),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        stackedOrNot(),
      ],
    );
  }
}
