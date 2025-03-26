import 'package:freezed_annotation/freezed_annotation.dart';

part 'paper.freezed.dart';
part 'paper.g.dart';

@freezed
sealed class Paper with _$Paper {
  factory Paper({
    required String doi,
    required String title,
    required String abstract,
  }) = _Paper;

  factory Paper.fromJson(Map<String, dynamic> json) => _$PaperFromJson(json);
}

@freezed
sealed class FindPaperQuery with _$FindPaperQuery {
  factory FindPaperQuery({required String query}) = _FindPaperQuery;

  factory FindPaperQuery.fromJson(Map<String, dynamic> json) =>
      _$FindPaperQueryFromJson(json);
}
