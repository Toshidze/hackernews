import 'package:flutter/material.dart';
import 'package:hackernews/models/newsModels.dart';
import 'package:hackernews/utilities/constants.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentForm extends StatelessWidget {
  final News newsItem;
  CommentForm({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    children.add(
      CommentCard(
        key: Key("${newsItem.id}"),
        newsItem: newsItem,
      ),
    );
    if (newsItem.comments.length > 0) {
      List<Widget> comments = newsItem.comments
          .map((item) => CommentForm(
                newsItem: item,
                key: Key("${item.id}"),
              ))
          .toList();

      children.add(
        Padding(
          padding: EdgeInsets.only(left: 0),
          child: IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Container(width: 18.0),
                Expanded(
                  child: Column(children: comments),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(children: children);
  }
}

class CommentCard extends StatefulWidget {
  final News newsItem;
  CommentCard({Key? key, required this.newsItem}) : super(key: key);

  @override
  _CommentCardState createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(widget.newsItem.time * 1000);
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 6.0),
                    child: Text(
                      widget.newsItem.by != null
                          ? widget.newsItem.by
                          : 'unknown',
                      style: kTitleCommentTextStyle,
                    ),
                  ),
                  Container(
                    child: Text(
                      timeago.format(date),
                      style: kCommentTextStyleGray,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 6.0),
                  child: Text(
                    widget.newsItem.text.isNotEmpty
                        ? widget.newsItem.text
                        : "(Not available)",
                    style: kCommentTextStyle,
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 14),
                          hintText: 'Write',
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.zero,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.zero,
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 24,
                        width: 64,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              padding: EdgeInsets.all(5),
                              backgroundColor:
                                  Color(0xFF1D49BA).withOpacity(0.16)),
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          },
                          child: Text(
                            isVisible == true ? "SEND" : "REPLY",
                            style: TextStyle(
                              fontFamily: 'FiraSans',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              color: Color(0xFF1D49BA),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 24,
                        width: 64,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero),
                              padding: EdgeInsets.all(5),
                              backgroundColor:
                                  Color(0xFF1D49BA).withOpacity(0.16)),
                          onPressed: () {},
                          child: const Text(
                            'SHARE',
                            style: TextStyle(
                              fontFamily: 'FiraSans',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                              color: Color(0xFF1D49BA),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
