import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:lucerna/models/paper.dart';

part 'paper_finder.g.dart';

@riverpod
Future<List<Paper>> findPapers(Ref ref, String query) async {
  final response = await http.post(
    Uri.http('192.168.61.149:8080', '/papers/find'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'query': query}),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList
        .map((json) => Paper.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  return [];
}
