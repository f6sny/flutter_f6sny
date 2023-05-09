import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

import '../widgets/jokes_list_item.dart';

class Joke extends StatelessWidget {
  final dynamic joke;
  const Joke({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    print('im here in the joke screen item field');
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.jokePageTitle)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(constants.spacingFactor),
          child: Column(
            children: [
              JokesListItem(
                joke: joke,
              )
            ],
          ),
        )));
  }
}
