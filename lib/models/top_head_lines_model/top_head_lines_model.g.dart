// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_head_lines_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopHeadLinesModel _$TopHeadLinesModelFromJson(Map<String, dynamic> json) =>
    TopHeadLinesModel(
      status: json['status'] as String?,
      totalResults: json['totalResults'] as int?,
      articles: (json['articles'] as List<dynamic>?)
          ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopHeadLinesModelToJson(TopHeadLinesModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };
