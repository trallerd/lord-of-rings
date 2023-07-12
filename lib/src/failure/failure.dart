abstract class Failure {
  final String message;
  final int code;

  Failure({
    required this.message,
    required this.code,
  });
}

class APIFailure extends Failure {
  APIFailure({
    super.message = 'Algo deu errado. Tente novamete mais tarde!',
    super.code = 404,
  });
}

class RepositoryFailure extends Failure {
  RepositoryFailure({
    super.message = 'Cheque sua coneção com a internet e tente novamente',
    super.code = 503,
  });
}
