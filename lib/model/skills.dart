import 'package:portfolio/model/enum/skill_type.dart';
import 'package:portfolio/model/portfolio_api_data.dart';

class SkillData implements PortfolioAPIData {
  final String name;
  final String description;
  final String logoPath;
  late final SkillType type;

  SkillData.fromJson(Map<String, dynamic> json)
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
