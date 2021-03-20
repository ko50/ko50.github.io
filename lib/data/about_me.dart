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
        return '所属';
      case IntroduceTopic.major:
        return '専攻';
      case IntroduceTopic.spec:
        return '仕様';
      case IntroduceTopic.misc:
        return 'その他';
    }
  }

  String get content {
    switch (this) {
      case IntroduceTopic.belong:
        return '茨城工業高等専門学校 国際創造工学科 二年';
      case IntroduceTopic.major:
        return '情報系/グローバル系 専攻';
      case IntroduceTopic.spec:
        return '17歳 男性';
      case IntroduceTopic.misc:
        return '好きなゲームはテトリス';
    }
  }
}
