import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

class JokesFooter extends StatelessWidget {
  final dynamic tags;
  const JokesFooter({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    String formattedTags =
        tags.map<String>((tag) => '#${tag['title']}').join('، ');

    return formattedTags.isNotEmpty
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                  child: Text(
                formattedTags,
                style: DefaultTextStyle.of(context).style.apply(
                      fontSizeFactor: (constants.fontSizeFactor * 0.7),
                      color: Colors.black38,
                    ),
              )),
            ],
          )
        : Container();
  }
}
