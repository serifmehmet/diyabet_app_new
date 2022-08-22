enum FoodQueries { query, single }

extension FoodQueryExtension on FoodQueries {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case FoodQueries.query:
        return MapEntry('query', value);
      case FoodQueries.single:
        return MapEntry('foodId', value);
    }
  }
}
