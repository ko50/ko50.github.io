import 'package:portfolio/model/helper/image_url_replacer.dart';
import 'package:portfolio/model/portfolio_api_data.dart';

class ContactData implements PortfolioAPIData {
  final String name;
  final String userName;
  final String serviceLink;
  final String logoUrl;

  ContactData.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.userName = json['user_name'],
        this.serviceLink = json['service_link'],
        this.logoUrl = replaceMediaUrl(json['logo']);
}
