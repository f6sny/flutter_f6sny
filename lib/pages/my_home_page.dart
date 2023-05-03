import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:http/http.dart' as http;
import 'package:timeago/timeago.dart' as timeago;

class Joke {
  int id;
  String content;
  String author;
  String status;
  DateTime modifiedAt;

  Joke(this.id, this.content, this.author, this.status, this.modifiedAt);

  @override
  String toString() {
    return '$author يقول, $content ($modifiedAt)';
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late ScrollController _scrollController;
  final List<Joke> _jokes = [];
  int page = 1;
  int jokesRetreived = 0;
  bool isLoading = false;
  bool hasMore = true;
  int lastjokesRetreivedCount = 0;
  // int _counter = 0;

  _getJokes() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse("${constants.baseUrl}jokes?_start=$jokesRetreived"));

    List data = jsonDecode(response.body);

    if (data.isNotEmpty) {
      jokesRetreived += data.length;
      lastjokesRetreivedCount = data.length;

      for (final item in data) {
        _jokes.add(Joke(item["id"], item["content"], item["author"]["username"],
            item["status"], DateTime.parse(item["updated_at"])));
      }
    } else {
      hasMore = false;
    }

    setState(() {
      page += 1;
      isLoading = false;
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
          !isLoading) {
        if (hasMore) {
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
        appBar: AppBar(
          title: Text(widget.title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black)),
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
                          child: FittedBox(child: CircularProgressIndicator()));
                    }
                    return Card(
                      child: Padding(
                          padding:
                              const EdgeInsets.all(constants.spacingFactor),
                          child: Column(
                            children: [
                              Text(
                                _jokes[index].content,
                                style: DefaultTextStyle.of(context).style.apply(
                                    fontSizeFactor: constants.fontSizeFactor),
                              ),
                              const SizedBox(
                                height: constants.spacingFactor,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "قالها ${_jokes[index].author}, بتاريخ ${_jokes[index].modifiedAt.toString().substring(0, 10)}",
                                    style: DefaultTextStyle.of(context)
                                        .style
                                        .apply(
                                          fontSizeFactor:
                                              (constants.fontSizeFactor * 0.7),
                                          color: Colors.black38,
                                        ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    );
                  }),
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: constants.spacingFactor,
                      )),
                  itemCount: _jokes.length + (hasMore ? 1 : 0))),
        ));
  }
}
