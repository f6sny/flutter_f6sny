import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.settingsPageTitle)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(constants.spacingFactor),
          child: Column(
            children: [
              Text(
                "صفحة الإعدادات",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontWeightDelta: 2, fontSizeFactor: 1.5),
              )
            ],
          ),
        )));
  }
}
