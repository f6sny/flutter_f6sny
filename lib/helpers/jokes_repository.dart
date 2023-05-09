import 'dart:convert';

import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:http/http.dart' as http;

class JokesRepository {
  static const _baseUrl = '${constants.baseUrl}/jokes';

  static Future<List> getJokes({int page = 1}) async {
    print('getting jokes');
    final response = await http.get(Uri.parse(
        '$_baseUrl?_start=${(page - 1) * constants.jokesPerPage}&_limit=${constants.jokesPerPage}'));

    List data = jsonDecode(response.body);

    return data;
  }
}
