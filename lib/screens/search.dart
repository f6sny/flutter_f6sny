import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.searchPageTitle)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(constants.spacingFactor),
          child: Column(
            children: const [
              Text(
                "صفحة البحث",
                style: TextStyle(
                    inherit: true,
                    fontWeight: FontWeight.w600,
                    fontSize: constants.fontSize * 1.5),
              )
            ],
          ),
        )));
  }
}
