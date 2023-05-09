import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:flutter_f6sny/widgets/jokes_footer.dart';
import 'package:flutter_f6sny/widgets/jokes_footer_actions.dart';
import 'package:flutter_f6sny/widgets/jokes_header.dart';

class JokesListItem extends StatelessWidget {
  final dynamic joke;

  const JokesListItem({super.key, required this.joke});

  Widget _authorAvatar(BuildContext context) {
    String userInitials =
        joke["author"]["username"].toString().substring(0, 2).toUpperCase();

    if (joke["author"]["display_picture"] == null) {
      return CircleAvatar(
        backgroundColor: Colors.black12,
        radius: 26,
        child: Text(
          userInitials,
          // style: DefaultTextStyle.of(context)
          // .style
          //   .apply(color: Colors.black54, fontSizeFactor: 1.2)
        ),
      );
    }

    String avatarURL = constants.baseUrl +
        joke["author"]["display_picture"]["formats"]["thumbnail"]["url"];
    return CircleAvatar(
      backgroundColor: Colors.black12,
      radius: 26,
      backgroundImage: NetworkImage(avatarURL),
      child: Text(
        userInitials,
        //style:
        // DefaultTextStyle.of(context).style.apply(color: Colors.black54)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(joke["display_picture"]);

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
              _authorAvatar(context),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: constants.spacingFactor * 2),
                    child: Column(
                      children: [
                        JokesHeader(
                            author: joke["author"],
                            jokeUpdatedAt: joke["updated_at"]),
                        Text(
                          joke["content"],
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
            ],
          )
        ],
      ),
    );
  }
}
