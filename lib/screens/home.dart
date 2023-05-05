import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:flutter_f6sny/model/joke.dart';
import 'package:flutter_f6sny/widgets/bottom_navigation_menu.dart';
import '../helpers/jokes_repository.dart';
import '../widgets/jokes_list_item.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController _scrollController;
  final List<Joke> _jokes = [];
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
    return Scaffold(
      bottomNavigationBar: BottomNavigationMenu(selectedIndex: 0),
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
                return SizedBox(
                  width: 60,
                  height: 60,
                  child: FittedBox(
                    child: indicator,
                  ),
                );
              }
              return JokesListItem(joke: _jokes[index]);
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
