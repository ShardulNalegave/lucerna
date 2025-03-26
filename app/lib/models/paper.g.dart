// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Paper _$PaperFromJson(Map<String, dynamic> json) => _Paper(
  doi: json['doi'] as String,
  title: json['title'] as String,
  abstract: json['abstract'] as String,
);

Map<String, dynamic> _$PaperToJson(_Paper instance) => <String, dynamic>{
  'doi': instance.doi,
  'title': instance.title,
  'abstract': instance.abstract,
};

_FindPaperQuery _$FindPaperQueryFromJson(Map<String, dynamic> json) =>
    _FindPaperQuery(query: json['query'] as String);

Map<String, dynamic> _$FindPaperQueryToJson(_FindPaperQuery instance) =>
    <String, dynamic>{'query': instance.query};
