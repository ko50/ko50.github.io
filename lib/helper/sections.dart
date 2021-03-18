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
}
