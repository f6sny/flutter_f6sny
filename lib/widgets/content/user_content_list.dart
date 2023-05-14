import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'user_content.dart';

class ContentScreen extends StatefulWidget {
  final String pageTitle;
  final Future<List<dynamic>> Function(int) getJokes;

  const ContentScreen(
      {super.key, required this.pageTitle, required this.getJokes});

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late ScrollController _scrollController;
  final List<dynamic> _jokes = [];
  final indicator = const CupertinoActivityIndicator();
  int _page = 1;
  bool _isLoading = false;
  bool _hasMore = true;

  Future<void> _getJokes() async {
    setState(() {
      _isLoading = true;
    });

    final jokes = await widget.getJokes(_page);

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
        middle: Text(widget.pageTitle),
      ),
      child: SafeArea(
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
            return UserContent(content: _jokes[index]);
          }),
          separatorBuilder: ((context, index) => const Divider(
                height: 20,
              )),
          itemCount: _jokes.length + (_hasMore ? 1 : 0),
        ),
      ),
    );
  }
}
