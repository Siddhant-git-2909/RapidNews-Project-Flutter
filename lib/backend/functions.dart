import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:technewz/utils/key.dart';

Future<List> fetchnews([String query = "technology"]) async {
  final url = Uri.parse(
      "https://newsapi.org/v2/everything?q=$query&language=en&sortBy=publishedAt&pageSize=20&apiKey=${Key.key}");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    if (data["status"] == "ok") {
      return data["articles"] ?? [];
    } else {
      throw Exception(data["message"]);
    }
  } else {
    throw Exception("HTTP Error ${response.statusCode}");
  }
}
