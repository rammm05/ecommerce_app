class AppExceptions implements Exception{
  String title, errMsg;
  AppExceptions({
    required this.title,
    required this.errMsg
});

  @override
  String toString() {
    return "$title : $errMsg";
  }
}

class NoInternetException extends AppExceptions{
  NoInternetException({required String msg})
      : super(title: "No Internet Connection", errMsg: msg);
}

class BadRequestException extends AppExceptions{
  BadRequestException({required String msg})
      : super(title: "Bad Request", errMsg: msg);
}

class UnauthorizedException extends AppExceptions{
  UnauthorizedException({required String msg})
      : super(title: "Unauthorized", errMsg: msg);
}

class InvalidInputException extends AppExceptions{
  InvalidInputException({required String msg})
      : super(title: "Invalid Input", errMsg: msg);
}

class FetchDataException extends AppExceptions{
  FetchDataException({required String msg})
      : super(title: "Error during communication", errMsg: msg);
}

class ServerException extends AppExceptions{
  ServerException({required String msg})
      : super(title: "Internal Server Error", errMsg: msg);
}