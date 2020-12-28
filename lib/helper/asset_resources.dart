enum AssetResources {
  CircularCotton,
}

extension AssetResourcesData on AssetResources {
  String get path {
    switch (this) {
      case AssetResources.CircularCotton:
        return 'assets/images/cotton_circle.png';

      default:
        return '';
    }
  }
}
