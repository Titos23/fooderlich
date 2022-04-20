class AppLink {
  
  static const String kHomePath = '/home';
  static const String kOnboardingPath = '/onboarding';
  static const String kLoginPath = '/login';
  static const String kProfilePath = '/profile';
  static const String kItemPath = '/item';
  
  static const String kTabParam = 'tab';
  static const String kIdParam = 'id';
  
  String? location;
  int? currentTab;
  String? itemId;
  AppLink({
    this.location,
    this.currentTab,
    this.itemId,
  });

// Add fromLocation
static AppLink fromLocation(String? location) {
    location = Uri.decodeFull(location ?? '');
    final uri = Uri.parse(location);
    final params = uri.queryParameters;

    final currentTab = int.tryParse(params[AppLink.kTabParam] ?? '');
    final itemId = params[AppLink.kIdParam];
    final link = AppLink(
      location: uri.path,
      currentTab: currentTab,
      itemId: itemId,
    );
    // 6
    return link;
  }


// Add to Location
String toLocation() {
    // 1
    String addKeyValPair({
      required String key,
      String? value,
    }) =>
        value == null ? '' : '${key}=$value&';
    // 2
    switch (location) {
      // 3
      case kLoginPath:
        return kLoginPath;
      // 4
      case kOnboardingPath:
        return kOnboardingPath;
      // 5
      case kProfilePath:
        return kProfilePath;
      // 6
      case kItemPath:
        var loc = '$kItemPath?';
        loc += addKeyValPair(
          key: kIdParam,
          value: itemId,
        );
        return Uri.encodeFull(loc);
      // 7
      default:
        var loc = '$kHomePath?';
        loc += addKeyValPair(
          key: kTabParam,
          value: currentTab.toString(),
        );
        return Uri.encodeFull(loc);
    }
  }


}
