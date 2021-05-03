
import 'package:portfolio/model/portfolio_api_data.dart';

class WorkData implements PortfolioAPIData {
  final String name;
  final String description;
  final String snapshotPath;
  final String link;
  final List<String> tags;

  WorkData.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.snapshotPath = json['snapshot_path'],
        this.link = json['link'],
        this.tags = json['tags'].split(',');
}
