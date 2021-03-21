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
            'もともとReactで書いたものを'
            'Flutterのwebへの正式サポートを機にFlutterで書き直しました';
    }
  }

  List<String> get tags {
    switch (this) {
      case WorkData.portfolio:
        return ['Dart', 'Flutter', 'Flutter for web'];
    }
  }
}
