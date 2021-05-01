import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';
import 'package:portfolio/model/model_base.dart';

class WorkData implements ModelBase {
  final String name;
  final String description;
  final String snapshotPath;
  final String link;
  final List<String> tags;

  static const String nameSpace = 'works';

  static Future<List<WorkData>> fetchAll() async {
    print('WorkData: Fetcing data');
    final Uri url = Uri.parse('$apiUriRoot/$nameSpace');
    final http.Response response = await http.get(url);

    print('WorkData: ${response.statusCode}');
    print('WorkData: ${response.body}');

    if (response.statusCode != HttpStatus.ok)
      throw Exception('$nameSpace: Failed to fetch data');

    final List<dynamic> dataJson = json.decode(utf8.decode(response.bodyBytes));
    final List<WorkData> data = dataJson
        .map<WorkData>(
          (e) => WorkData._fromJson(e),
        )
        .toList();

    return data;
  }

  WorkData._fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.snapshotPath = json['snapshot_path'],
        this.link = json['link'],
        this.tags = json['tags'].split(',');
}
