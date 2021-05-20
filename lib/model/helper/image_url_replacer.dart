import 'package:portfolio/constants.dart';

String replaceMediaUrl(String rawUrl) =>
    rawUrl.replaceAll(RegExp('http://127.0.0.1:8001/api/v1'), apiUriRoot);
