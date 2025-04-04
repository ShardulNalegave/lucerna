import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generate_podcast.g.dart';

@riverpod
Future<bool> generatePodcast(Ref ref, String filePath) async {
  final request = http.MultipartRequest(
    'POST',
    Uri.http('192.168.19.149:8080', '/podcasts/generate'),
  );
  request.files.add(await http.MultipartFile.fromPath('paper', filePath));

  var response = await request.send();
  if (response.statusCode == 200) {
    return true;
  }

  return false;
}
