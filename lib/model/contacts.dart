import 'package:portfolio/model/portfolio_api_data.dart';

class ContactData implements PortfolioAPIData {
  final String name;
  final String userName;
  final String serviceLink;
  final String logoPath;

  ContactData.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.userName = json['user_name'],
        this.serviceLink = json['service_link'],
        this.logoPath = json['logo_path'];
}
