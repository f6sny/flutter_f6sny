import 'package:flutter/cupertino.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:flutter_f6sny/themes/theme.dart';

import '../../screens/tag.dart';

class UserContentFooter extends StatelessWidget {
  final List? tags;
  const UserContentFooter({super.key, this.tags});

  @override
  Widget build(BuildContext context) {
    return tags != null
        // ignore: sized_box_for_whitespace
        ? Container(
            width: double.maxFinite,
            child: Wrap(
              spacing: 4,
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
          "#${tag["title"]}",
          style: DefaultTextStyle.of(context).style.apply(
                fontSizeFactor: (AppSettings.fontSizeFactor * 0.9),
                color: myColors["UserContentFooter"]["ClickableTag"]
                    ["TextColor"],
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
