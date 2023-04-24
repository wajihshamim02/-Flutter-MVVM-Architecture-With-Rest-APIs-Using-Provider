

import 'package:mvvm_structure/data/network/response/api_responce.dart';

class ApiResponse<T> {

  Status? status;
  String? message;
  T? data;

  ApiResponse(this.status,this.message,this.data);


  ApiResponse.Loading() : status = Status.LOADING;
  ApiResponse.completed() : status = Status.COMPLETED;  
  ApiResponse.error() : status = Status.ERROR;    


@override
  String toString() {
    // TODO: implement toString
    return 'Status : $status /n Message: $message /n Data: $data';
  }

}