import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:namefully/namefully.dart';

import '../../themes/theme.dart';

class UserContentHeader extends StatelessWidget {
  final String jokeUpdatedAt;
  final dynamic author;
  final bool stacked;
  const UserContentHeader(
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

    Widget stackedOrNot() {
      if (stacked) {
        return Column(
          children: [
            Text(
              name.full,
              style: myTextStyles(context, "fullnameTextStyle"),
            ),
            Text(
              "@${author["username"]}",
              textDirection: TextDirection.ltr,
              style: myTextStyles(context, "usernameTextStyle"),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        );
      }
      return Expanded(
        child: RichText(
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          text: TextSpan(
            text: name.full,
            style: myTextStyles(context, "fullnameTextStyle"),
            children: [
              TextSpan(
                locale: const Locale('en'),
                text: "${author["username"]}@",
                style: myTextStyles(context, "usernameTextStyle"),
              ),
              TextSpan(
                  text: ". $timagoString",
                  style: myTextStyles(context, "timeagoTextStyle")),
            ],
          ),
        ),
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
