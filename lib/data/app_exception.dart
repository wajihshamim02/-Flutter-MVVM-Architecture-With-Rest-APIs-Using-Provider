class AppException implements Exception {


  final _message;
  final _prefix;

  AppException(this._message, this._prefix);

  String toString() {
    // TODO: implement toString
    return '$_message $_prefix';
  }

}

class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'Error During Communication') ;

}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request') ;

}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message]) : super(message, 'Unauthorized request') ;
}


class InvalidInputRequest extends AppException {
  InvalidInputRequest([String? message]) : super(message, 'Invalid request') ;
}



