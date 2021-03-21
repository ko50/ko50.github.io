enum WorkData { portfolio }

extension WorkDataExtention on WorkData {
  String get title {
    switch (this) {
      case WorkData.portfolio:
        return 'Portfolio';
    }
  }

  String get description {
    switch (this) {
      case WorkData.portfolio:
        return 'ポートフォリオです\n'
            'もともとReactで書いてあったものを'
            'Flutter for webの正式リリースをきっかけにFlutterで書き直しました';
    }
  }

  List<String> get tags {
    switch (this) {
      case WorkData.portfolio:
        return ['Dart', 'Flutter', 'Flutter for web'];
    }
  }

  String get snapshotPath => 'assets/images/works/${this.title}.png';
}
