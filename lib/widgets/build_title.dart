import 'package:flutter/material.dart';
import 'package:hackernews/models/news_models.dart';
import 'package:hackernews/utilities/constants.dart';
import 'package:hackernews/utilities/helper.dart';

class BuildTitle extends StatelessWidget {
  final News newsItem;
  const BuildTitle({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
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
                        newsItem.score.toString(),
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
                          newsItem.title,
                          maxLines: 2,
                          style: kTitleTextStyle,
                        ),
                        Text(
                          '${cutUrl(newsItem.url)}',
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: 'FiraSans',
                            fontSize: 16,
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
                              'by ${newsItem.by}',
                              style: TextStyle(
                                fontFamily: 'FiraSans',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black.withOpacity(0.24),
                              ),
                            ),
                            Text(
                              '  ${convertDateAgo(newsItem.time)}',
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
}
