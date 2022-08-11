import '../../../entities/user_idf.dart';

class DeleteUserIdfParams {
  final int? userIdfId;
  final UserIdf? userIdfToDelete;

  DeleteUserIdfParams({this.userIdfId, this.userIdfToDelete});
}
