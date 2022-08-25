enum RecipeQueries { list }

extension RecipeQueryExtension on RecipeQueries {
  MapEntry<String, String> toMapEntry(String value) {
    switch (this) {
      case RecipeQueries.list:
        return MapEntry("UserId", value);
    }
  }
}
