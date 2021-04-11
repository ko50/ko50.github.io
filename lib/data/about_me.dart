enum IntroduceTopic {
  belong,
  major,
  spec,
  misc,
}

extension Extension on IntroduceTopic {
  String get title {
    switch (this) {
      case IntroduceTopic.belong:
        return 'Belong';
      case IntroduceTopic.major:
        return 'Major';
      case IntroduceTopic.spec:
        return 'Spec';
      case IntroduceTopic.misc:
        return 'Prefer';
    }
  }

  String get content {
    switch (this) {
      case IntroduceTopic.belong:
        return '茨城工業高等専門学校 国際創造工学科 二年';
      case IntroduceTopic.major:
        return '情報系/グローバル系 専攻';
      case IntroduceTopic.spec:
        return '$_age歳 男性';
      case IntroduceTopic.misc:
        return 'テトリスが好き';
    }
  }

  int get _age {
    final DateTime today = DateTime.now(), birthday = DateTime(2004, 2, 24);

    if (today.month < birthday.month ||
        (today.month == birthday.month && today.day < birthday.day)) {
      return today.year - birthday.year - 1;
    }

    return today.year - birthday.year;
  }
}
