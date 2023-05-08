import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../helpers/jokes_repository.dart';
import '../widgets/jokes_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  final List _jokes = [];
  final indicator = Platform.isAndroid
      ? const CircularProgressIndicator()
      : const CupertinoActivityIndicator();
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
                  return SizedBox(
                    width: 32,
                    height: 32,
                    child: FittedBox(
                      child: indicator,
                    ),
                  );
                }
                return JokesListItem(joke: _jokes[index]);
              }),
              separatorBuilder: ((context, index) => const Divider(
                    height: 1,
                  )),
              itemCount: _jokes.length + (_hasMore ? 1 : 0),
            ),
          ),
        ));
  }
}
