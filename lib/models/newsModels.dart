import 'package:json_annotation/json_annotation.dart';

part 'newsModels.g.dart';

@JsonSerializable()
class News {
  final String by;
  final descendants;
  final int id;
  // final List<dynamic> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  News(
      {required this.by,
      required this.descendants,
      required this.id,
      // required this.kids,
      required this.score,
      required this.time,
      required this.title,
      required this.type,
      required this.url});

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
