enum FoodQueries { query }

extension FoodQueryExtension on FoodQueries {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case FoodQueries.query:
        return MapEntry('query', value);
    }
  }
}
