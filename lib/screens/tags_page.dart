import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/extensions.dart';
import 'package:flutter_f6sny/helpers/tags_repository.dart';
import 'package:flutter_f6sny/screens/tag_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart';

import '../widgets/skeleton.dart';

class TagsPage extends StatefulWidget {
  const TagsPage({super.key});

  @override
  State<TagsPage> createState() => _TagsPageState();
}

class _TagsPageState extends State<TagsPage> {
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
          padding: EdgeInsets.all(AppSettings.spacingFactor),
          child: Column(children: [
            Flexible(
                child: _isLoading
                    ? ListView.separated(
                        itemBuilder: ((context, index) => const TagSkeleton()),
                        separatorBuilder: (context, index) => const Divider(
                              height: 15,
                            ),
                        itemCount: 5)
                    : ListView.separated(
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(AppSettings.spacingFactor),
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
                                  builder: (context) =>
                                      TagPage(tag: _tags[index]),
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
