import 'package:portfolio/model/enum/skill_type.dart';
import 'package:portfolio/model/helper/image_url_replacer.dart';
import 'package:portfolio/model/portfolio_api_data.dart';

class SkillData implements PortfolioAPIData {
  final String name;
  final String description;
  final String iconUrl;
  late final SkillType type;

  SkillData.fromJson(Map<String, dynamic> json)
      : this.name = json['name'],
        this.description = json['description'],
        this.iconUrl = replaceMediaUrl(json['icon']) {
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
