import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.searchPageTitle)),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(AppSettings.spacingFactor),
          child: Column(
            children: [
              Text(
                "صفحة البحث",
                style: DefaultTextStyle.of(context)
                    .style
                    .apply(fontWeightDelta: 2, fontSizeFactor: 1.5),
              )
            ],
          ),
        )));
  }
}
