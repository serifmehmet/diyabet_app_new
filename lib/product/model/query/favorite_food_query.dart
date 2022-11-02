enum FavoriteFoodQuery { user }

extension FavoriteFoodQueryExtension on FavoriteFoodQuery {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case FavoriteFoodQuery.user:
        return MapEntry("userId", value);
    }
  }
}
