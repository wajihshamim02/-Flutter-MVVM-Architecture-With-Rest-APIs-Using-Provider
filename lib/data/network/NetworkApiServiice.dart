


import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mvvm_structure/data/app_exception.dart';

import 'BaseApiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices{
  @override

  Future getGetApiServices(String url) async {

    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
    // Socker exception is a not internet exception
    on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
    
  }
   dynamic returnResponse(http.Response response){

    switch(response.statusCode){
      case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
      case 400:
      throw BadRequestException(response.body.toString());
      case 404:
      throw UnAuthorizedException(response.body.toString());
      case 500:
      default:
      FetchDataException('Error accured while communcating with server ' + response.body.toString());
    }
  }

  @override
  Future GetpostApiServices(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url),
      body: data).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    }
      on SocketException {
      throw FetchDataException('No Internet Connection Fetch Data EXception');
    }
  return responseJson;
  }
 
}