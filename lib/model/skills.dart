import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';
import 'package:portfolio/model/enum/skill_type.dart';
import 'package:portfolio/model/model_base.dart';

class SkillData implements ModelBase {
  final String name;
  final String description;
  final String logoPath;
  late final SkillType type;

  static const String nameSpace = 'skills';

  static Future<List<SkillData>> fetchAll() async {
    print('SkillData: Fetcing data');
    final Uri url = Uri.parse('$apiUriRoot/$nameSpace');
    final http.Response response = await http.get(url);

    print('SkillData: ${response.statusCode}');
    print('SkillData: ${response.body}');

    if (response.statusCode != HttpStatus.ok)
      throw Exception('$nameSpace: Failed to fetch data');

    final List<dynamic> dataJson = json.decode(utf8.decode(response.bodyBytes));
    final List<SkillData> data = dataJson
        .map<SkillData>(
          (e) => SkillData._fromJson(e),
        )
        .toList();

    return data;
  }

  SkillData._fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.logoPath = json['logo_path'] {
    switch (json['skill_type']) {
      case 'Languages':
        type = SkillType.lang;
        break;
      case 'Frameworks':
        type = SkillType.framework;
        break;
      case 'Tools':
        type = SkillType.tool;
        break;
    }
  }
}
