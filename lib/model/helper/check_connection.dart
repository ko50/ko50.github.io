import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:portfolio/constants.dart';

Future<bool> checkAPIConnection() async {
  final Uri uri = Uri.parse(apiUriRoot);
  final http.Response res;

  try {
    res = await http.get(uri);
  } catch (_) {
    return false;
  }

  return res.statusCode == HttpStatus.ok;
}
