import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';

class AboutMeData {
  final String title;
  final String content;

  static const String name = 'about_me';

  static Future<List<AboutMeData>?> fetchAll() async {
    print('AboutMeData: Fetcing data');
    final Uri url = Uri.parse('$apiUriRoot/$name');
    final http.Response response = await http.get(url);

    print('AboutMeData: ${response.statusCode}');

    if (response.statusCode != HttpStatus.ok)
      throw Exception('$name: Failed to fetch data');

    final List<dynamic> dataJson = json.decode(response.body);
    final List<AboutMeData> data = dataJson
        .map<AboutMeData>(
          (e) => AboutMeData._fromJson(e),
        )
        .toList();

    return data;
  }

  AboutMeData._fromJson(Map<String, dynamic> json)
      : this.title = json['title'],
        this.content = json['content'];
}
