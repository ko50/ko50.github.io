import 'package:portfolio/model/portfolio_api_data.dart';

class AboutMeData implements PortfolioAPIData {
  final String title;
  final String content;

  AboutMeData.fromJson(Map<String, dynamic> json)
      : this.title = json['title'],
        this.content = json['content'];
}
