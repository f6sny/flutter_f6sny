import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_f6sny/widgets/jokes_page_comments_area.dart';
import 'package:flutter_f6sny/widgets/jokes_page_joke_area.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

class Joke extends StatelessWidget {
  final dynamic joke;
  const Joke({super.key, required this.joke});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('im here in the joke screen item field');
    }
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.jokePageTitle)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(constants.spacingFactor),
          child: Column(
            children: [
              JokesPageJokeArea(
                joke: joke,
              ),
              const SizedBox(
                height: 16,
              ),
              JokesPageCommentsArea(jokeComments: joke["comments"]),
            ],
          ),
        )));
  }
}
