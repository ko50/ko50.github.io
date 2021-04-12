enum SkillType { lang, framework, tool }

extension SkillTypeExtension on SkillType {
  String get name {
    switch (this) {
      case SkillType.lang:
        return 'Languages';
      case SkillType.framework:
        return 'Frameworks';
      case SkillType.tool:
        return 'Tools';
    }
  }
}
