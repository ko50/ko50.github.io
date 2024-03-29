import 'dart:io';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';

abstract class PortfolioAPIData {
  static Future<List<dynamic>> fetch(String? nameSpace) async {
    if (nameSpace == null) return [];

    print('$nameSpace: Fetcing data');

    final Uri url = Uri.parse('$apiUriRoot/$nameSpace');
    late final http.Response response;

    try {
      response = await http.get(url);
    } catch (e) {
      print('$nameSpace: An error ($e) was occured in fetching data');
      return [];
    }

    print('$nameSpace: ${response.statusCode}');
    print('$nameSpace: ${response.body}');

    if (response.statusCode != HttpStatus.ok) {
      print('$nameSpace: Failed to fetch data');
      return [];
    }

    return json.decode(utf8.decode(response.bodyBytes));
  }
}
