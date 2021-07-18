// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newsModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News(
    by: json['by'] as String,
    descendants: json['descendants'],
    id: json['id'] as int,
    // kids: json['kids'] as List<dynamic>,
    score: json['score'] as int,
    time: json['time'] as int,
    title: json['title'] as String,
    type: json['type'] as String,
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
      'type': instance.type,
      'url': instance.url,
      // 'kids': instance.kids,
    };
