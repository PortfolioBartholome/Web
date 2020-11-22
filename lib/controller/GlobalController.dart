import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/model/APIElement.dart';
import 'package:portfolio_web/model/AboutMe.dart';
import 'package:portfolio_web/model/Home.dart';
import 'package:portfolio_web/model/Knowledge.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/HttpManager.dart';
import 'package:portfolio_web/services/ResponseManager.dart';

class GlobalController {
  Future<List<APIElement>> getEverything(
      {@required BuildContext context,
      @required GlobalConfiguration globalConfiguration}) async {
    final List<APIElement> apiElements = List<APIElement>();
    HttpManager httpManager = HttpManager(
        path: 'global',
        context: context,
        globalConfiguration: globalConfiguration);
    await httpManager.get();
    ResponseManager responseManager = ResponseManager(
      response: httpManager.response,
      context: context,
    );
    apiElements.addAll(
        getAboutMeFromJson(jsonToDecode: responseManager.response.body));
    apiElements.addAll(
        getHomeFromJson(jsonToDecode: responseManager.response.body));
    apiElements.addAll(
        getProjectFromJson(jsonToDecode: responseManager.response.body));
    apiElements.addAll(
        getKnowledgeFromJson(jsonToDecode: responseManager.response.body));
    return apiElements;
  }

  List<APIElement> getAboutMeFromJson({@required String jsonToDecode}) {
    var aboutMe = List<APIElement>();
    Iterable list = json.decode(jsonToDecode);
    aboutMe.addAll(list
        .where((value) => value['type'] == "AboutMe")
        .map((model) => AboutMe.fromJson(model))
        .toList());
    return aboutMe;
  }

  List<APIElement> getAPIElementFromJson(
      {@required String jsonToDecode,
      @required String type,
      @required APIElement Function(dynamic) apiElement}) {
    var apiElements = List<APIElement>();
    Iterable list = json.decode(jsonToDecode);
    apiElements.addAll(list
        .where((value) => value['type'] == type)
        .map((model) => apiElement(model))
        .toList());
    return apiElements;
  }

  List<APIElement> getProjectFromJson({@required String jsonToDecode}) {
    var project = List<APIElement>();
    Iterable list = json.decode(jsonToDecode);
    project.addAll(list
        .where((value) => value['type'] == "Project")
        .map((model) => Project.fromJson(model))
        .toList());
    return project;
  }

  List<APIElement> getHomeFromJson({@required String jsonToDecode}) {
    var home = List<APIElement>();
    Iterable list = json.decode(jsonToDecode);
    home.addAll(list
        .where((value) => value['type'] == "Home")
        .map((model) => Home.fromJson(model))
        .toList());
    return home;
  }

  List<APIElement> getKnowledgeFromJson({@required String jsonToDecode}) {
    var knowledge = List<APIElement>();
    Iterable list = json.decode(jsonToDecode);
    knowledge.addAll(list
        .where((value) => value['type'] == "Knowledge")
        .map((model) => Knowledge.fromJson(model))
        .toList());
    return knowledge;
  }
}
