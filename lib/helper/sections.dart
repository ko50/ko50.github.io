import 'package:portfolio/model/about_me.dart';
import 'package:portfolio/model/contacts.dart';
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

  Type get dataType {
    switch (this) {
      case Section.root:
        return Null;
      case Section.aboutMe:
        return AboutMeData;
      case Section.skills:
        return SkillData;
      case Section.works:
        return WorkData;
      case Section.contacts:
        return ContactData;
    }
  }
}
