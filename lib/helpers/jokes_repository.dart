import 'dart:convert';

import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:http/http.dart' as http;

import 'package:flutter_f6sny/model/joke.dart';

class JokesRepository {
  static const _baseUrl = '${constants.baseUrl}jokes';

  static Future<List<Joke>> getJokes({int page = 1}) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?_start=${(page - 1) * constants.jokesPerPage}&_limit=${constants.jokesPerPage}'));

    List data = jsonDecode(response.body);

    return data
        .map<Joke>((item) => Joke(
              item["id"],
              item["content"],
              item["author"]["username"],
              item["status"],
              DateTime.parse(item["updated_at"]),
            ))
        .toList();
  }
}
