import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;

class JokesHeader extends StatelessWidget {
  final String jokeUpdatedAt;
  final dynamic author;
  const JokesHeader(
      {super.key, required this.author, required this.jokeUpdatedAt});

  @override
  Widget build(BuildContext context) {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.createdByWhen(
              author["username"],
              timeago.format(DateTime.parse(jokeUpdatedAt),
                  locale: AppLocalizations.of(context)!.localeName)),
          style: DefaultTextStyle.of(context).style.apply(
                fontSizeFactor: (constants.fontSizeFactor * 0.7),
                color: Colors.black38,
              ),
        ),
      ],
    );
  }
}
