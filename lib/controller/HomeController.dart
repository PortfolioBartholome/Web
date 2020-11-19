import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/model/Home.dart';
import 'package:portfolio_web/services/HttpManager.dart';
import 'package:portfolio_web/services/ResponseManager.dart';

class HomeController {
  

  Future<List<Home>> getAllKnowledge(
      {@required BuildContext context,
        @required GlobalConfiguration globalConfiguration}) async {
    HttpManager httpManager = HttpManager(
        path: 'home',
        context: context,
        globalConfiguration: globalConfiguration);
    await httpManager.get();
    ResponseManager responseManager = ResponseManager(
      response: httpManager.response,
      context: context,
    );
    return getHomeFromJson(jsonToDecode: responseManager.response.body);
  }

  List<Home> getHomeFromJson({@required String jsonToDecode}) {
    var home = List<Home>();
    Iterable list = json.decode(jsonToDecode);
    home.addAll(list.map((model) => Home.fromJson(model)).toList());
    return home;
  }
}
