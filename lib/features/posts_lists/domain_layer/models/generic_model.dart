sealed class Result<T> {}

class Success<T> extends Result<T> {
  final T data;

  Success(this.data);
}

class Failure<T> extends Result<T> {
  final ErrorType type;
  final String errorMessage;

  Failure(this.type, this.errorMessage);

  Failure.networkIssue()
      : type = ErrorType.networkError,
        errorMessage = "";

  Failure.errorResponse(String errorResponseMsg)
      : type = ErrorType.backendError,
        errorMessage = errorResponseMsg;
}

enum ErrorType {
  networkError,
  backendError
}