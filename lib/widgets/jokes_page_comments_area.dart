import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:flutter_f6sny/widgets/content/user_content.dart';

class JokesPageCommentsArea extends StatefulWidget {
  final List jokeComments;
  const JokesPageCommentsArea({super.key, required this.jokeComments});

  @override
  State<JokesPageCommentsArea> createState() => _JokesPageCommentsAreaState();
}

class _JokesPageCommentsAreaState extends State<JokesPageCommentsArea> {
  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = DefaultTextStyle.of(context).style.apply(
          fontSizeFactor: (constants.fontSizeFactor * 1.2),
          fontWeightDelta: 4,
          color: Colors.black87,
        );

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
                    color: Colors.black,
                    child: Text(
                      "التعليقات",
                      textAlign: TextAlign.right,
                      style: titleStyle,
                    )))
          ],
        ),
        commentsOrNot(),
      ],
    );
  }
}
