import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hackernews/models/newsModels.dart';
// import 'package:hackernews/screens/news_screen.dart';
import 'package:hackernews/utilities/constants.dart';
import 'package:hackernews/utilities/modelLoad.dart';

class CommentHeader extends StatefulWidget {
  final News newsItem;
  CommentHeader(this.newsItem);

  @override
  _CommentHeaderState createState() => _CommentHeaderState();
}

class _CommentHeaderState extends State<CommentHeader> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTitle(),
          textField(),
        ],
      ),
    );
  }

  Container buildTitle() {
    return Container(
      child: Column(
        children: [
          // TextButton(
          //   style: TextButton.styleFrom(padding: EdgeInsets.zero),
          //   onPressed: () {},
          //   child: Row(
          //     children: [
          //       Icon(
          //         Icons.arrow_back,
          //         size: 16,
          //         color: Colors.black,
          //       ),
          //       Text(
          //         ' BACK',
          //         style: TextStyle(
          //           letterSpacing: 2,
          //           fontFamily: 'FiraSans',
          //           fontSize: 12,
          //           fontWeight: FontWeight.w600,
          //           color: Colors.black,
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color(0xFFF1F1F1)),
                    bottom: BorderSide(color: Color(0xFFF1F1F1)))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.newsItem.score.toString(),
                        style: TextStyle(
                          fontFamily: 'FiraSans',
                          color: Colors.black.withOpacity(0.24),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Icon(
                        Icons.arrow_upward,
                        size: 16,
                        color: Colors.black.withOpacity(0.24),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.newsItem.title,
                          maxLines: 2,
                          style: kTitleTextStyle,
                        ),
                        Text(
                          '${cutUrl(widget.newsItem.url)}',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'FiraSans',
                            fontSize: 16, //!  16
                            fontWeight: FontWeight.w400,
                            color: Colors.black.withOpacity(0.24),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'by ${widget.newsItem.by}',
                              style: TextStyle(
                                fontFamily: 'FiraSans',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.24),
                              ),
                            ),
                            Text(
                              '  ${convertDateAgo(widget.newsItem.time)}',
                              style: TextStyle(
                                fontFamily: 'FiraSans',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.24),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container textField() {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'COMMENTS',
                textAlign: TextAlign.left,
                style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'FiraSans',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: TextField(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
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
          Visibility(
            visible: isVisible,
            child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(children: [
                  Container(
                    height: 24,
                    width: 64,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero),
                          padding: EdgeInsets.all(5),
                          backgroundColor: Color(0xFF1D49BA).withOpacity(0.16)),
                      onPressed: () {},
                      child: Text(
                        "SEND",
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
                ])),
          )
        ],
      ),
    );
  }
}
