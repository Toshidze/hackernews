part of 'newsModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  var kids = json['kids'] != null ? json['kids'] : [];
  var text =
      parse(json['text'] != null ? json['text'] : "").documentElement?.text;
  var descendants = json['descendants'] != null ? json['descendants'] : 0;
  var score = json['score'] != null ? json['score'] : 0;

  return News(
    by: json['by'] == null ? 'null' : json['by'],
    descendants: descendants,
    id: json['id'] == null ? 'null' : json['id'],
    kids: kids,
    text: text as String,
    // deleted: json['deleted'],
    score: score,
    time: json['time'] == null ? 'null' : json['time'],
    title: json['title'] == null ? 'null' : json['title'],
    type: json['type'] == null ? 'null' : json['type'],
    url: json['url'] == null ? 'null' : json['url'],
  );
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'by': instance.by,
      'descendants': instance.descendants,
      'id': instance.id,
      'score': instance.score,
      'time': instance.time,
      'title': instance.title,
      // 'deleted': instance.deleted,
      'text': instance.text,
      'type': instance.type,
      'url': instance.url,
      'kids': instance.kids,
    };
