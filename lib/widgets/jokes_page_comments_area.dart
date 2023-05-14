import 'package:flutter/material.dart';
import 'package:flutter_f6sny/widgets/content/user_content.dart';
import 'package:flutter_f6sny/themes/theme.dart';

class JokesPageCommentsArea extends StatefulWidget {
  final List jokeComments;
  const JokesPageCommentsArea({super.key, required this.jokeComments});

  @override
  State<JokesPageCommentsArea> createState() => _JokesPageCommentsAreaState();
}

class _JokesPageCommentsAreaState extends State<JokesPageCommentsArea> {
  @override
  Widget build(BuildContext context) {
    Widget commentsOrNot() {
      if (widget.jokeComments.isEmpty) {
        return const Text("No comments right now");
      }

      return ListView.separated(
          itemBuilder: ((context, index) {
            return UserContent(content: widget.jokeComments[index]);
          }),
          separatorBuilder: ((context, index) => const Divider(
                height: 1,
              )),
          itemCount: widget.jokeComments.length);
    }

    return Column(
      children: [
        const Divider(
          height: 20,
          thickness: 1,
        ),
        Row(
          children: [
            Expanded(
                child: Title(
                    title: "hi",
                    color: myColors["JokesPageCommentsArea"]["title"]
                        ["textColor"],
                    child: Text(
                      "التعليقات",
                      textAlign: TextAlign.right,
                      style: myTextStyles(context, "commentsTitleStyle"),
                    )))
          ],
        ),
        commentsOrNot(),
      ],
    );
  }
}
