import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();
  const factory Failure.unAuthorized() = UnAuthorizedError;
  const factory Failure.emptyResponse() = EmptyResponseError;
  const factory Failure.itemNotFound() = ItemNotFoundError;
}
