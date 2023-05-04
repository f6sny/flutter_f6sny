import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:timeago/timeago.dart' as timeago;

import 'package:flutter_f6sny/model/joke.dart';

import '../helpers/jokes_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  final List<Joke> _jokes = [];
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
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    timeago.setLocaleMessages('ar_short', timeago.ArShortMessages());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(constants.spacingFactor),
          child: ListView.separated(
            controller: _scrollController,
            itemBuilder: ((context, index) {
              if (index == _jokes.length) {
                return const SizedBox(
                  width: 60,
                  height: 60,
                  child: FittedBox(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              final joke = _jokes[index];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(constants.spacingFactor),
                  child: Column(
                    children: [
                      Text(
                        joke.content,
                        style: DefaultTextStyle.of(context).style.apply(
                              fontSizeFactor: constants.fontSizeFactor,
                            ),
                      ),
                      const SizedBox(
                        height: constants.spacingFactor,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "بواسطة ${joke.author}, ${timeago.format(joke.modifiedAt, locale: 'ar')}",
                            style: DefaultTextStyle.of(context).style.apply(
                                  fontSizeFactor:
                                      (constants.fontSizeFactor * 0.7),
                                  color: Colors.black38,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }),
            separatorBuilder: ((context, index) => const SizedBox(
                  height: constants.spacingFactor,
                )),
            itemCount: _jokes.length + (_hasMore ? 1 : 0),
          ),
        ),
      ),
    );
  }
}
