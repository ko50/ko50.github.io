import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';
import 'package:portfolio/model/model_base.dart';

class ContactData implements ModelBase {
  final String name;
  final String userName;
  final String serviceLink;
  final String logoPath;

  static const String nameSpace = 'contacts';

  static Future<List<ContactData>> fetchAll() async {
    print('ContactData: Fetcing data');
    final Uri url = Uri.parse('$apiUriRoot/$nameSpace');
    final http.Response response = await http.get(url);

    print('ContactData: ${response.statusCode}');

    if (response.statusCode != HttpStatus.ok)
      throw Exception('$nameSpace: Failed to fetch data');

    final List<dynamic> dataJson = json.decode(response.body);
    final List<ContactData> data = dataJson
        .map<ContactData>(
          (e) => ContactData._fromJson(e),
        )
        .toList();

    return data;
  }

  ContactData._fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.userName = json['user_name'],
        this.serviceLink = json['service_link'],
        this.logoPath = json['logo_path'];
}
