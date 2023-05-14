import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:flutter_f6sny/themes/theme.dart';
import 'package:flutter_f6sny/widgets/content/user_content_footer.dart';
import 'package:flutter_f6sny/widgets/content/user_content_footer_actions.dart';
import 'package:flutter_f6sny/widgets/content/user_content_header.dart';

class UserContent extends StatelessWidget {
  final dynamic content;

  const UserContent({super.key, required this.content});

  Widget _authorAvatar(BuildContext context) {
    String userInitials =
        content["author"]["username"].toString().substring(0, 2).toUpperCase();

    if (content["author"]["display_picture"] == null) {
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
        content["author"]["display_picture"]["formats"]["thumbnail"]["url"];
    return CircleAvatar(
      backgroundColor: myColors["UserContent"]["CircleAvatar"]
          ["backgroundColor"],
      radius: 26,
      backgroundImage: NetworkImage(avatarURL),
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
                        EdgeInsets.only(left: AppSettings.spacingFactor * 2),
                    child: Column(
                      children: [
                        UserContentHeader(
                          author: content["author"],
                          jokeUpdatedAt: content["created_at"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                content["content"],
                              ),
                            ),
                          ],
                        ),
                        UserContentFooter(
                          tags: content["tags"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        UserContentFooterActions(joke: content),
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
