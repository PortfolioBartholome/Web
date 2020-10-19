import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_web/model/ErrorResponse.dart';
import 'package:portfolio_web/widget/FlushBarMessage.dart';

class ResponseManager {
  final BuildContext context;
  final http.Response response;
  final Function onSuccess;
  final Function onFailure;

  ResponseManager(
      {@required this.response,
        @required this.context,
        this.onSuccess,
        this.onFailure});

  checkResponseAndShowWithFlushBarMessageTheAnswer({@required String successMessage}) {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
      FlushBarMessage.goodMessage(content: successMessage)
          .showFlushBar(context);
    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(context);
    }
  }
  checkResponseAndShowWithFlushBarMessageTheAnswerThenPopTheContext({@required String successMessage}) {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
      FlushBarMessage.goodMessage(content: successMessage)
          .showFlushBar(context).whenComplete(() => Navigator.of(context).pop());

    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(context);
    }
  }

  /*checkResponseAndShowWithFlushBarMessageTheAnswerThenGoToDestination({@required Widget destination,@required String successMessage}) {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
      FlushBarMessage.goodMessage(content: successMessage)
          .showFlushBarAndNavigate(context, destination);
    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(context);
    }
  }*/


  checkResponseAndReturnTheDesiredElement({@required dynamic elementToReturn}) {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
      return elementToReturn;
    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(context);
      return elementToReturn;
    }
  }

  checkResponseRetrieveInformationWithAFunction({@required Function toReturn, @required dynamic elementToReturnIfFalse}) {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
      return toReturn();
    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(this.context);
      return elementToReturnIfFalse;
    }
  }

  void checkResponseAndExecuteFunctionIfOk() {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(this.context);
    }
  }

  bool checkResponseReturnTrueIfOkAndFalseIfNotOk() {
    if (response.statusCode >= 100 && response.statusCode < 400) {
      if (this.onSuccess != null) onSuccess();
      return true;
    } else {
      if (this.onFailure != null) onFailure();
      FlushBarMessage.errorMessage(
          content: ErrorResponse.fromJson(json.decode(response.body)).content)
          .showFlushBar(this.context);
      return false;
    }
  }
}