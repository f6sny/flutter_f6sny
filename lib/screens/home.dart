import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/jokes_repository.dart';
import '../widgets/content/user_content.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/skeleton.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  final List _jokes = [];
  final indicator = const CupertinoActivityIndicator();
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  Future<void> _getJokes() async {
    setState(() {
      _isLoading = true;
    });

    final jokes = await JokesRepository.getJokes(page: _page);

    if (jokes.isNotEmpty) {
      _jokes.addAll(jokes);
      _page += 1;
    } else {
      _hasMore = false;
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _getJokes();

    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent * 0.95 &&
          !_isLoading) {
        if (_hasMore) {
          _getJokes();
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
            middle: Text(AppLocalizations.of(context)!.homePageTitle)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: ListView.separated(
              controller: _scrollController,
              itemBuilder: ((context, index) {
                if (index == _jokes.length) {
                  return ListView.separated(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) => const ContentSkeleton(),
                      separatorBuilder: (context, index) => const Divider(
                            height: 15,
                          ),
                      itemCount: 3);
                }
                return UserContent(content: _jokes[index]);
              }),
              separatorBuilder: ((context, index) => const Divider(
                    height: 20,
                  )),
              itemCount: _jokes.length + (_hasMore ? 1 : 0),
            ),
          ),
        ));
  }
}
