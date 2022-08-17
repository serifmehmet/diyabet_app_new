import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.serverException() = ServerException;
  const factory AppException.unAuthorized() = UnAuthorized;
  const factory AppException.emptyResponseList() = EmptyResponseList;
}
