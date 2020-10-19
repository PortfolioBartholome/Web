
import 'package:flutter/cupertino.dart';

class ErrorResponse{
  final int statusCode;
  final String content;
  bool isOk;

  ErrorResponse({@required this.statusCode, @required this.content});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      statusCode: json['statusCode'],
      content: json['message'],
    );
  }

  void setIsOk(bool value) => this.isOk = value;
}