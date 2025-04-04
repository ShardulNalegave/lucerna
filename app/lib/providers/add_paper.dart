import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lucerna/models/paper.dart';

part 'add_paper.g.dart';

@riverpod
Future<Paper?> addPaper(
  Ref ref,
  String doi,
  String title,
  String abstract,
) async {
  final response = await http.post(
    Uri.http('192.168.19.149:8080', '/papers'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'doi': doi, 'title': title, 'abstract': abstract}),
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return Paper.fromJson(json);
  }

  return null;
}
