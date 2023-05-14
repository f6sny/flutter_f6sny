import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:flutter_f6sny/widgets/content/user_content_footer.dart';
import 'package:flutter_f6sny/widgets/content/user_content_footer_actions.dart';
import 'package:flutter_f6sny/widgets/content/user_content_header.dart';
import 'package:flutter_f6sny/themes/theme.dart';

class JokesPageJokeArea extends StatelessWidget {
  final dynamic joke;

  const JokesPageJokeArea({super.key, required this.joke});

  Widget _authorAvatar(BuildContext context) {
    String userInitials =
        joke["author"]["username"].toString().substring(0, 2).toUpperCase();

    if (joke["author"]["display_picture"] == null) {
      return CircleAvatar(
        backgroundColor: myColors["UserContent"]["CircleAvatar"]
            ["backgroundColor"],
        radius: 26,
        child: Text(userInitials,
            style: DefaultTextStyle.of(context).style.apply(
                fontWeightDelta: 2,
                color: myColors["UserContent"]["CircleAvatar"]["textColor"],
                fontSizeFactor: 1.2)),
      );
    }

    String avatarURL = AppSettings.baseUrl +
        joke["author"]["display_picture"]["formats"]["thumbnail"]["url"];
    return CircleAvatar(
      backgroundColor: myColors["UserContent"]["CircleAvatar"]
          ["backgroundColor"],
      radius: 26,
      backgroundImage: NetworkImage(avatarURL),
      child: Text(
        userInitials,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: AppSettings.spacingFactor,
          top: AppSettings.spacingFactor,
          right: AppSettings.spacingFactor,
          left: AppSettings.spacingFactor * 2),
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
                    padding:
                        EdgeInsets.only(left: AppSettings.spacingFactor * 1.3),
                    child: Column(
                      children: [
                        UserContentHeader(
                          author: joke["author"],
                          jokeUpdatedAt: joke["updated_at"],
                          stacked: true,
                        ),
                        Text(
                          joke["content"],
                        ),
                        UserContentFooter(
                          tags: joke["tags"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        UserContentFooterActions(joke: joke),
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
