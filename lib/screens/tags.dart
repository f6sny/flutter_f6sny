import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/extensions.dart';
import 'package:flutter_f6sny/helpers/tags_repository.dart';
import 'package:flutter_f6sny/screens/tag.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

import '../widgets/skeleton.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final List _tags = [];
  final indicator = const CupertinoActivityIndicator();
  bool _isLoading = true;

  Future<void> _getTags() async {
    setState(() {
      _isLoading = true;
    });

    final tags = await TagsRepository.getTags();
    _tags.addAll(tags);

    setState(() {
      _isLoading = false;
    });
    //print(_tags);
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('hi from  tags');
    }
    _getTags();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.tagsPageTitle)),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(constants.spacingFactor),
          child: Column(children: [
            Flexible(
                child: _isLoading
                    ? ListView.separated(
                        itemBuilder: ((context, index) => TagSkeleton()),
                        separatorBuilder: (context, index) => Divider(
                              height: 15,
                            ),
                        itemCount: 5)
                    : ListView.separated(
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(constants.spacingFactor),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("#${_tags[index]["title"]}",
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .apply(
                                              fontSizeFactor: 1.4,
                                              fontWeightDelta: 2,
                                              color: _tags[index]["hex_color"]
                                                  .toString()
                                                  .toColor())),
                                  Text(_tags[index]["description"],
                                      style: DefaultTextStyle.of(context)
                                          .style
                                          .apply(
                                            color: Colors.black54,
                                          )),
                                ],
                              ),
                            ),
                            onTap: () async {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  title: "tag",
                                  maintainState: true,
                                  builder: (context) => Tag(tag: _tags[index]),
                                ),
                              );
                            },
                          );
                        }),
                        separatorBuilder: ((context, index) => const Divider(
                              height: 1,
                            )),
                        itemCount: _tags.length,
                      ))
          ]),
        )));
  }
}

class TagSkeleton extends StatelessWidget {
  const TagSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Skeleton(height: 20, width: 160),
              SizedBox(
                height: 10,
              ),
              Skeleton(height: 20, width: 260)
            ],
          )
        ],
      ),
    );
  }
}
