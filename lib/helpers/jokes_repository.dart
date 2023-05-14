import 'dart:convert';

import 'package:flutter_f6sny/constants.dart';
import 'package:http/http.dart' as http;

class JokesRepository {
  static final _baseUrl = '${AppSettings.baseUrl}/jokes';

  static Future<List> getJokes({int page = 1}) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?_start=${(page - 1) * AppSettings.jokesPerPage}&_limit=${AppSettings.jokesPerPage}'));

    List data = jsonDecode(response.body);

    return data;
  }

  static Future<List> getTagJokes({required int tagId, int page = 1}) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?tags.id=$tagId&_start=${(page - 1) * AppSettings.jokesPerPage}&_limit=${AppSettings.jokesPerPage}'));

    List data = jsonDecode(response.body);

    return data;
  }
}
