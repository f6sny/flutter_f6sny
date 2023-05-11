import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:flutter_f6sny/widgets/jokes_footer.dart';
import 'package:flutter_f6sny/widgets/jokes_footer_actions.dart';
import 'package:flutter_f6sny/widgets/jokes_header.dart';

class UserContent extends StatelessWidget {
  final dynamic joke;

  const UserContent({super.key, required this.joke});

  Widget _authorAvatar(BuildContext context) {
    String userInitials =
        joke["author"]["username"].toString().substring(0, 2).toUpperCase();

    if (joke["author"]["display_picture"] == null) {
      return CircleAvatar(
        backgroundColor: Colors.black12,
        radius: 26,
        child: Text(userInitials,
            style: DefaultTextStyle.of(context).style.apply(
                fontWeightDelta: 2,
                color: Colors.black54,
                fontSizeFactor: 1.2)),
      );
    }
    String avatarURL = constants.baseUrl +
        joke["author"]["display_picture"]["formats"]["thumbnail"]["url"];
    return CircleAvatar(
      backgroundColor: Colors.black12,
      radius: 26,
      backgroundImage: NetworkImage(avatarURL),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: constants.spacingFactor,
          top: constants.spacingFactor,
          right: constants.spacingFactor,
          left: constants.spacingFactor * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: constants.spacingFactor * 2),
                    child: Column(
                      children: [
                        JokesHeader(
                          author: joke["author"],
                          jokeUpdatedAt: joke["created_at"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                joke["content"],
                              ),
                            ),
                          ],
                        ),
                        JokesFooter(
                          tags: joke["tags"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        JokesFooterActions(joke: joke),
                      ],
                    ),
                  )),
              _authorAvatar(context),
            ],
          )
        ],
      ),
    );
  }
}
