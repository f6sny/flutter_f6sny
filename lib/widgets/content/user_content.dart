import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:flutter_f6sny/themes/theme.dart';
import 'package:flutter_f6sny/widgets/content/user_content_footer.dart';
import 'package:flutter_f6sny/widgets/content/user_content_footer_actions.dart';
import 'package:flutter_f6sny/widgets/content/user_content_header.dart';
import 'package:flutter_f6sny/widgets/content/user_content_user_avatar.dart';

class UserContent extends StatefulWidget {
  final dynamic content;

  const UserContent({super.key, required this.content});

  @override
  State<UserContent> createState() => _UserContentState();
}

class _UserContentState extends State<UserContent> {
  @override
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
                          author: widget.content["author"],
                          jokeUpdatedAt: widget.content["created_at"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.content["content"],
                              ),
                            ),
                          ],
                        ),
                        UserContentFooter(
                          tags: widget.content["tags"],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        UserContentFooterActions(joke: widget.content),
                      ],
                    ),
                  )),
              UserAvatar(content: widget.content),
            ],
          )
        ],
      ),
    );
  }
}
