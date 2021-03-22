enum ContactWay {
  Twitter,
  GitHub,
}

extension ContactWayExtension on ContactWay {
  String get name {
    switch (this) {
      case ContactWay.Twitter:
        return 'Twitter';
      case ContactWay.GitHub:
        return 'GitHub';
    }
  }

  String get userName {
    switch (this) {
      case ContactWay.Twitter:
        return '@ko_CottonLove';
      case ContactWay.GitHub:
        return '@ko50';
    }
  }
  
  String get link {
    switch (this) {
      case ContactWay.Twitter:
        return 'https://twitter.com/ko_CottonLove';
      case ContactWay.GitHub:
        return 'https://github.com/ko50';
    }
  }

  String get logoPath => 'assets/images/contacts/${this.name}.svg';
}
