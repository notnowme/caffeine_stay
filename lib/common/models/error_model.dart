// sealed 패턴 매칭을 이용해서
// TODO 정의해둔 모든 상태 처리할 수 있게

sealed class CustomError {
  final String title;
  final String message;
  final String path;

  CustomError({
    required this.title,
    required this.message,
    required this.path,
  });
}

class CustomUserError extends CustomError {
  CustomUserError({
    required super.title,
    required super.message,
    required super.path,
  });
}

class CustomNetworkError extends CustomError {
  CustomNetworkError({
    required super.title,
    required super.message,
    required super.path,
  });
}

class CustomUserWarningkError extends CustomError {
  CustomUserWarningkError({
    required super.title,
    required super.message,
    required super.path,
  });
}

class CustomOthersError extends CustomError {
  CustomOthersError({
    required super.title,
    required super.message,
    required super.path,
  });
}
