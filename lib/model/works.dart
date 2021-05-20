import 'package:portfolio/model/helper/image_url_replacer.dart';
import 'package:portfolio/model/portfolio_api_data.dart';

class WorkData implements PortfolioAPIData {
  final String name;
  final String description;
  final String screenshotUrl;
  final String link;
  final List<String> tags;

  WorkData.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.screenshotUrl = replaceMediaUrl(json['screenshot']),
        this.link = json['link'],
        this.tags = json['tags'].split(',');
}
