enum SkillData {
  Python,
  Flutter,
  Dart,
  React,
  TypeScript,
  Git,
  GitHub,
}

enum SkillType { lang, framework, tool }

extension Extension on SkillData {
  String get name {
    switch (this) {
      case SkillData.Python:
        return 'Python';
      case SkillData.Flutter:
        return 'Flutter';
      case SkillData.Dart:
        return 'Dart';
      case SkillData.React:
        return 'React';
      case SkillData.TypeScript:
        return 'TypeScript';
      case SkillData.Git:
        return 'Git';
      case SkillData.GitHub:
        return 'GitHub';
    }
  }

  String get description {
    switch (this) {
      case SkillData.Python:
        return '競プロをやっていたときは使っていました';
      case SkillData.Flutter:
        return '一説によると、今世界で最もアツいフレームワークらしいです';
      case SkillData.Dart:
        return '癖のない文法が売りらしいですが、実際無くて七癖です';
      case SkillData.React:
        return '状態管理のやり方がわかりません';
      case SkillData.TypeScript:
        return 'Reactを書く言語として接しています';
      case SkillData.Git:
        return '人並かそれ以下くらいに習得しています';
      case SkillData.GitHub:
        return '人並かそれ以下くらいに習得しています';
    }
  }

  String get logoPath => 'assets/images/skills/${this.name}.svg';

  SkillType get type {
    switch (this) {
      case SkillData.Python:
      case SkillData.Dart:
      case SkillData.TypeScript:
        return SkillType.lang;

      case SkillData.Flutter:
      case SkillData.React:
        return SkillType.framework;

      case SkillData.Git:
      case SkillData.GitHub:
        return SkillType.tool;
    }
  }
}

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
