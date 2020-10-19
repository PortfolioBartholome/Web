import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/services/HttpManager.dart';

class AuthController {
  Future<String> getNeededToken(
      {@required BuildContext context, @required GlobalConfiguration globalConfiguration, @required String username, @required String password}) async {
    HttpManager httpManager = HttpManager(
        path: 'auth/token', context: context, globalConfiguration: globalConfiguration,
        token: globalConfiguration.getValue("clientId"),
        map: <String, dynamic>{
          "username": username,
          "password": password,
          "grant_type" : "password"
        });
    await httpManager.postBasic();
    return json.decode(httpManager.response.body)['access_token'];
  }
}