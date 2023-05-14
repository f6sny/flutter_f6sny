import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_f6sny/extensions.dart';
import '../helpers/jokes_repository.dart';
import '../widgets/content/user_content.dart';
import '../widgets/skeleton.dart';

class Tag extends StatefulWidget {
  final dynamic tag;
  const Tag({super.key, this.tag});

  @override
  State<Tag> createState() => _TagState();
}

class _TagState extends State<Tag> {
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

    final jokes =
        await JokesRepository.getTagJokes(tagId: widget.tag["id"], page: _page);

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
        middle: Text(widget.tag["title"]),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TagPageHeader(
                tag: widget.tag,
              ),
              const Divider(),
              ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (index == _jokes.length) {
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => const ContentSkeleton(),
                      separatorBuilder: (context, index) => const Divider(
                        height: 15,
                      ),
                      itemCount: 5,
                    );
                  }
                  return UserContent(content: _jokes[index]);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 20,
                ),
                itemCount: _jokes.length + (_hasMore ? 1 : 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagPageHeader extends StatelessWidget {
  final dynamic tag;

  const TagPageHeader({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "#${tag["title"]}",
            style: DefaultTextStyle.of(context).style.apply(
                  fontSizeFactor: 1.4,
                  fontWeightDelta: 2,
                  color: tag["hex_color"].toString().toColor(),
                ),
          ),
          Text(
            tag["description"],
            style: DefaultTextStyle.of(context).style.apply(
                  color: Colors.black54,
                ),
          ),
          Text("عندنا ${tag["jokes"]} نكتة تحت تصنيف #${tag["title"]}",
              style: DefaultTextStyle.of(context).style.apply(
                    color: Colors.black54,
                  ))
        ],
      ),
    );
  }
}
