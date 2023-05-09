import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/helpers/tags_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart' as constants;

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {
  final List _tags = [];

  Future<void> _getTags() async {
    final tags = await TagsRepository.getTags();
    _tags.addAll(tags);
    setState(() {});
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
          child: ListView.separated(
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.all(constants.spacingFactor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_tags[index]["title"],
                        style: DefaultTextStyle.of(context).style.apply(
                              fontSizeFactor: 1.4,
                              fontWeightDelta: 2,
                            )),
                    Text(_tags[index]["description"],
                        style: DefaultTextStyle.of(context).style.apply(
                              color: Colors.black54,
                            )),
                  ],
                ),
              );
            }),
            separatorBuilder: ((context, index) => const Divider(
                  height: 1,
                )),
            itemCount: _tags.length,
          ),
        )));
  }
}
