import 'dart:async';
import 'dart:core';

abstract class BaseApiServices{
  Future<dynamic> getGetApiServices(String url);
  Future<dynamic> GetpostApiServices(String url,dynamic data);
}
