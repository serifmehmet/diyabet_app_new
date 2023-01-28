enum UserQuery { resetPassword }

extension UserQueryExtension on UserQuery {
  List<MapEntry<String, String>> toMapEntry(String email, String newPassword) {
    switch (this) {
      case UserQuery.resetPassword:
        return [
          MapEntry("email", email),
        ];
    }
  }
}
