import 'dart:convert';

import 'package:flutter_f6sny/constants.dart' as constants;
import 'package:http/http.dart' as http;

class TagsRepository {
  static const _baseUrl = '${constants.baseUrl}/tags';

  static Future<List> getTags({int page = 1}) async {
    print('getting tags');
    final response = await http.get(Uri.parse(_baseUrl));

    List data = jsonDecode(response.body);

    return data;
  }
}
