import 'package:portfolio/model/about_me.dart';
import 'package:portfolio/model/contacts.dart';
import 'package:portfolio/model/portfolio_api_data.dart';
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
  String get title {
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

  String get subTitle {
    switch (this) {
      case Section.root:
        return '';
      case Section.aboutMe:
        return 'Know about ko';
      case Section.skills:
        return 'Can use';
      case Section.works:
        return 'I worked';
      case Section.contacts:
        return 'Know more';
    }
  }

  String? get apiNameSpace {
    switch (this) {
      case Section.root:
        return null;
      case Section.aboutMe:
        return 'about_me';
      case Section.skills:
        return 'skills';
      case Section.works:
        return 'works';
      case Section.contacts:
        return 'contacts';
    }
  }

  Future<List<PortfolioAPIData>> fetchData() async {
    final List<dynamic> dataJson = await PortfolioAPIData.fetch(apiNameSpace);

    switch (this) {
      case Section.root:
        return [];
      case Section.aboutMe:
        return dataJson
            .map<PortfolioAPIData>((json) => AboutMeData.fromJson(json))
            .toList();
      case Section.skills:
        return dataJson
            .map<PortfolioAPIData>((json) => SkillData.fromJson(json))
            .toList();
      case Section.works:
        return dataJson
            .map<PortfolioAPIData>((json) => WorkData.fromJson(json))
            .toList();
      case Section.contacts:
        return dataJson
            .map<PortfolioAPIData>((json) => ContactData.fromJson(json))
            .toList();
    }
  }
}
