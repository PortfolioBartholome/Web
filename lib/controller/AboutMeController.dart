import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/model/AboutMe.dart';
import 'package:portfolio_web/services/HttpManager.dart';
import 'package:portfolio_web/services/ResponseManager.dart';

class AboutMeController {
  Future<List<AboutMe>> getAllProject(
      {@required BuildContext context,
        @required GlobalConfiguration globalConfiguration}) async {
    HttpManager httpManager = HttpManager(
        path: 'aboutMe',
        context: context,
        globalConfiguration: globalConfiguration);
    await httpManager.get();
    ResponseManager responseManager = ResponseManager(
      response: httpManager.response,
      context: context,
    );
    return getAboutMeFromJson(jsonToDecode: responseManager.response.body);
  }

  List<AboutMe> getAboutMeFromJson({@required String jsonToDecode}) {
    var aboutMe = List<AboutMe>();
    Iterable list = json.decode(jsonToDecode);
    aboutMe.addAll(list.map((model) => AboutMe.fromJson(model)).toList());
    return aboutMe;
  }
}
