import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:portfolio_web/widget/FlushBarMessage.dart';

class HttpManager {
  String path;
  GlobalConfiguration globalConfiguration;
  final Map<String, dynamic> map;
  http.Response response;
  final BuildContext context;
  String token;

  HttpManager(
      {@required this.path,
      this.map,
      @required this.context,
      @required this.globalConfiguration,
      this.token});

  get() async {
    try {
      response = await http.get(
        globalConfiguration.getValue("apiUrl") + this.path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          //'Authorization': 'Bearer ' + this.token,
        },
      ).timeout(Duration(seconds: 20));
    } on TimeoutException catch (_) {
      print("timeout");
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      print("socket");
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }

  patch() async {
    try {
      response = await http
          .patch(
            globalConfiguration.getValue("apiUrl") + this.path,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ' + this.token
            },
            body: jsonEncode(this.map),
          )
          .timeout(Duration(seconds: 6));
    } on TimeoutException catch (_) {
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }

  postBearer() async {
    try {
      response = await http
          .post(
            globalConfiguration.getValue("apiUrl") + this.path,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Bearer ' + this.token,
            },
            body: jsonEncode(this.map),
          )
          .timeout(Duration(seconds: 6));
    } on TimeoutException catch (_) {
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }

  postBasic() async {
    try {
      response = await http
          .post(
            globalConfiguration.getValue("apiUrl") + this.path,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Authorization': 'Basic' + this.token,
            },
            body: jsonEncode(this.map),
          )
          .timeout(Duration(seconds: 6));
    } on TimeoutException catch (_) {
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }



  postWithoutBody() async {
    try {
      response = await http.post(
        globalConfiguration.getValue("apiUrl") + this.path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + this.token
        },
      ).timeout(Duration(seconds: 6));
    } on TimeoutException catch (_) {
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }

  delete() async {
    try {
      response = await http.delete(
        globalConfiguration.getValue("apiUrl") + this.path,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + this.token,
        },
      ).timeout(Duration(seconds: 6));
    } on TimeoutException catch (_) {
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }

  postWithoutAccessToken() async {
    try {
      response = await http
          .post(
            globalConfiguration.getValue("apiUrl") + this.path,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(this.map),
          )
          .timeout(Duration(seconds: 6));
    } on TimeoutException catch (_) {
      FlushBarMessage.informationMessage(
              content:
                  "Délai expiré, veuillez vérifier votre connexion internet")
          .showFlushBar(
        context,
      );
    } on SocketException {
      FlushBarMessage.informationMessage(
              content: "S'il vous plaît, vérifiez votre connexion internet")
          .showFlushBar(
        context,
      );
    } on Exception {
      FlushBarMessage.informationMessage(content: "Une erreur est survenue !")
          .showFlushBar(
        context,
      );
    }
  }

  setPath({@required String newPath}) {
    this.path = newPath;
  }
}
