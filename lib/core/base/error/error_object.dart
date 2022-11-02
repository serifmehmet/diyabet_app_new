import 'package:equatable/equatable.dart';

import 'failure.dart';

class ErrorObject extends Equatable {
  const ErrorObject({
    required this.errorType,
    required this.errorMessage,
  });

  final ErrorType errorType;
  final String errorMessage;

  @override
  List<Object?> get props => [errorType, errorMessage];

  static ErrorObject mapFailureToErrorObject({required Failure failure}) {
    return failure.when(
      unAuthorized: () => const ErrorObject(
        errorType: ErrorType.notLoggedIn,
        errorMessage: "Oturumunuz kapanmış, yeniden girişe yönlendiriliyorsunuz!",
      ),
      emptyResponse: () => const ErrorObject(
        errorType: ErrorType.returnedNothing,
        errorMessage: "Sunucudan geri dönüş olmadı!",
      ),
      itemNotFound: (itemType) => ErrorObject(
        errorType: ErrorType.itemNotFound,
        errorMessage: "Aradığınız $itemType bulunamadı!",
      ),
    );
  }
}

enum ErrorType { notLoggedIn, returnedNothing, itemNotFound }
