import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_f6sny/constants.dart';
import 'package:meilisearch/meilisearch.dart';

import '../widgets/content/user_content.dart';
import '../widgets/skeleton.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var client = MeiliSearchClient('https://search.f6sny.com',
      'bca2c63b74b297238d9d0c0f92eafc3271b7fef25c9ff64429976c83dcb4');
  late ScrollController _scrollController;
  final List _jokes = [];
  final indicator = const CupertinoActivityIndicator();
  int _page = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String _query = '';

  Future<void> _searchJokes() async {
    print('beginning future');
    setState(() {
      _isLoading = true;
    });
    await client.createIndex('jokes');
    var index = await client.getIndex('jokes');
    var result = await index.search(_query, offset: (_page * 20));

    if (result.hits.isNotEmpty) {
      _jokes.addAll(result.hits);
      _page += 1;
    } else {
      _hasMore = false;
    }
    print('end future');

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        print('reached controller');
        if (_hasMore) {
          _searchJokes();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
            middle: Text(AppLocalizations.of(context)!.searchPageTitle)),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(AppSettings.spacingFactor),
          child: SingleChildScrollView(
              child: Column(
            children: [
              CupertinoSearchTextField(onSubmitted: (value) async {
                _query = value;
                _jokes.clear();
                _page = 0;
                print(_query);
                await _searchJokes();
                print(_jokes.length);
                print('here');
              }),
              const SizedBox(
                height: 16,
              ),
              _query.isEmpty
                  ? Text("Nothing Yet")
                  : ListView.separated(
                      controller: _scrollController,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == _jokes.length) {
                          return ContentSkeleton();
                        }
                        return UserContent(content: _jokes[index]);
                      },
                      separatorBuilder: (context, index) => const Divider(
                            height: 20,
                          ),
                      itemCount: _jokes.length + (_hasMore ? 1 : 0)),
            ],
          )),
        )));
  }
}
