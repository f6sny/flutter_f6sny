import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

import '../../screens/tag.dart';

class UserContentFooter extends StatelessWidget {
  final List? tags;
  const UserContentFooter({super.key, this.tags});

  @override
  Widget build(BuildContext context) {
    // String formattedTags = "";
    // if (tags != null) {
    //   formattedTags = tags!.map<String>((tag) => '#${tag['title']}').join('، ');
    // }

    return tags != null
        ? Container(
            width: double.maxFinite,
            //color: Colors.red,
            child: Wrap(
              spacing: 4,
              runSpacing: 8,
              children: tags!.map((tag) => ClickableTag(tag: tag)).toList(),
            ),
          )
        : Container();
  }
}

class ClickableTag extends StatelessWidget {
  final dynamic tag;
  const ClickableTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Text(
          "#" + tag["title"],
          style: DefaultTextStyle.of(context).style.apply(
                fontSizeFactor: (constants.fontSizeFactor * 0.9),
                color: Colors.black38,
              ),
        ),
        onTap: () async {
          Navigator.push(
            context,
            CupertinoPageRoute(
              title: "tag",
              maintainState: true,
              builder: (context) => Tag(tag: tag),
            ),
          );
        });
  }
}
