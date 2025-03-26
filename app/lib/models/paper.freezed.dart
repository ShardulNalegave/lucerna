// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paper.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Paper {

 String get doi; String get title; String get abstract;
/// Create a copy of Paper
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaperCopyWith<Paper> get copyWith => _$PaperCopyWithImpl<Paper>(this as Paper, _$identity);

  /// Serializes this Paper to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Paper&&(identical(other.doi, doi) || other.doi == doi)&&(identical(other.title, title) || other.title == title)&&(identical(other.abstract, abstract) || other.abstract == abstract));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doi,title,abstract);

@override
String toString() {
  return 'Paper(doi: $doi, title: $title, abstract: $abstract)';
}


}

/// @nodoc
abstract mixin class $PaperCopyWith<$Res>  {
  factory $PaperCopyWith(Paper value, $Res Function(Paper) _then) = _$PaperCopyWithImpl;
@useResult
$Res call({
 String doi, String title, String abstract
});




}
/// @nodoc
class _$PaperCopyWithImpl<$Res>
    implements $PaperCopyWith<$Res> {
  _$PaperCopyWithImpl(this._self, this._then);

  final Paper _self;
  final $Res Function(Paper) _then;

/// Create a copy of Paper
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? doi = null,Object? title = null,Object? abstract = null,}) {
  return _then(_self.copyWith(
doi: null == doi ? _self.doi : doi // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,abstract: null == abstract ? _self.abstract : abstract // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Paper implements Paper {
   _Paper({required this.doi, required this.title, required this.abstract});
  factory _Paper.fromJson(Map<String, dynamic> json) => _$PaperFromJson(json);

@override final  String doi;
@override final  String title;
@override final  String abstract;

/// Create a copy of Paper
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaperCopyWith<_Paper> get copyWith => __$PaperCopyWithImpl<_Paper>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaperToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Paper&&(identical(other.doi, doi) || other.doi == doi)&&(identical(other.title, title) || other.title == title)&&(identical(other.abstract, abstract) || other.abstract == abstract));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,doi,title,abstract);

@override
String toString() {
  return 'Paper(doi: $doi, title: $title, abstract: $abstract)';
}


}

/// @nodoc
abstract mixin class _$PaperCopyWith<$Res> implements $PaperCopyWith<$Res> {
  factory _$PaperCopyWith(_Paper value, $Res Function(_Paper) _then) = __$PaperCopyWithImpl;
@override @useResult
$Res call({
 String doi, String title, String abstract
});




}
/// @nodoc
class __$PaperCopyWithImpl<$Res>
    implements _$PaperCopyWith<$Res> {
  __$PaperCopyWithImpl(this._self, this._then);

  final _Paper _self;
  final $Res Function(_Paper) _then;

/// Create a copy of Paper
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? doi = null,Object? title = null,Object? abstract = null,}) {
  return _then(_Paper(
doi: null == doi ? _self.doi : doi // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,abstract: null == abstract ? _self.abstract : abstract // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$FindPaperQuery {

 String get query;
/// Create a copy of FindPaperQuery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FindPaperQueryCopyWith<FindPaperQuery> get copyWith => _$FindPaperQueryCopyWithImpl<FindPaperQuery>(this as FindPaperQuery, _$identity);

  /// Serializes this FindPaperQuery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FindPaperQuery&&(identical(other.query, query) || other.query == query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'FindPaperQuery(query: $query)';
}


}

/// @nodoc
abstract mixin class $FindPaperQueryCopyWith<$Res>  {
  factory $FindPaperQueryCopyWith(FindPaperQuery value, $Res Function(FindPaperQuery) _then) = _$FindPaperQueryCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$FindPaperQueryCopyWithImpl<$Res>
    implements $FindPaperQueryCopyWith<$Res> {
  _$FindPaperQueryCopyWithImpl(this._self, this._then);

  final FindPaperQuery _self;
  final $Res Function(FindPaperQuery) _then;

/// Create a copy of FindPaperQuery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _FindPaperQuery implements FindPaperQuery {
   _FindPaperQuery({required this.query});
  factory _FindPaperQuery.fromJson(Map<String, dynamic> json) => _$FindPaperQueryFromJson(json);

@override final  String query;

/// Create a copy of FindPaperQuery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FindPaperQueryCopyWith<_FindPaperQuery> get copyWith => __$FindPaperQueryCopyWithImpl<_FindPaperQuery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FindPaperQueryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FindPaperQuery&&(identical(other.query, query) || other.query == query));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'FindPaperQuery(query: $query)';
}


}

/// @nodoc
abstract mixin class _$FindPaperQueryCopyWith<$Res> implements $FindPaperQueryCopyWith<$Res> {
  factory _$FindPaperQueryCopyWith(_FindPaperQuery value, $Res Function(_FindPaperQuery) _then) = __$FindPaperQueryCopyWithImpl;
@override @useResult
$Res call({
 String query
});




}
/// @nodoc
class __$FindPaperQueryCopyWithImpl<$Res>
    implements _$FindPaperQueryCopyWith<$Res> {
  __$FindPaperQueryCopyWithImpl(this._self, this._then);

  final _FindPaperQuery _self;
  final $Res Function(_FindPaperQuery) _then;

/// Create a copy of FindPaperQuery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_FindPaperQuery(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
