import 'package:portfolio/model/about_me.dart';
import 'package:portfolio/model/contacts.dart';
import 'package:portfolio/model/model_base.dart';
import 'package:portfolio/model/skills.dart';
import 'package:portfolio/model/works.dart';

enum Section {
  root,
  aboutMe,
  skills,
  works,
  contacts,
}

extension SectionExtension on Section {
  String get text {
    switch (this) {
      case Section.root:
        return 'ko\'s Portfolio';
      case Section.aboutMe:
        return 'About Me';
      case Section.skills:
        return 'Skills';
      case Section.works:
        return 'Works';
      case Section.contacts:
        return 'Contacts';
    }
  }

  Future<List<ModelBase>> Function() get fetchData {
    switch (this) {
      case Section.root:
        return () async => [];
      case Section.aboutMe:
        return AboutMeData.fetchAll;
      case Section.skills:
        return SkillData.fetchAll;
      case Section.works:
        return WorkData.fetchAll;
      case Section.contacts:
        return ContactData.fetchAll;
    }
  }
}
