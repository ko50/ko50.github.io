import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';
import 'package:portfolio/model/portfolio_api_data.dart';

class AboutMeData implements PortfolioAPIData {
  final String title;
  final String content;

  static const String nameSpace = 'about_me';

  static Future<List<AboutMeData>> fetchAll() async {
    print('AboutMeData: Fetcing data');
    final Uri url = Uri.parse('$apiUriRoot/$nameSpace');
    final http.Response response = await http.get(url);

    print('AboutMeData: ${response.statusCode}');
    print('AboutMeData: ${response.body}');

    if (response.statusCode != HttpStatus.ok)
      throw Exception('$nameSpace: Failed to fetch data');

    final List<dynamic> dataJson = json.decode(utf8.decode(response.bodyBytes));
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
