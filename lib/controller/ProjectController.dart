import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/HttpManager.dart';
import 'package:portfolio_web/services/ResponseManager.dart';

class ProjectController {


  Future<List<Project>> getAllProject(
      {@required BuildContext context,
      @required GlobalConfiguration globalConfiguration}) async {
    HttpManager httpManager = HttpManager(
        path: 'project',
        context: context,
        globalConfiguration: globalConfiguration);
    await httpManager.get();
    ResponseManager responseManager = ResponseManager(
      response: httpManager.response,
      context: context,
    );
    return getMessageFromJson(
        jsonToDecode: responseManager.response.body);
  }

  List<Project> getMessageFromJson({@required String jsonToDecode}) {
    var projects = List<Project>();
    Iterable list = json.decode(jsonToDecode);
    projects.addAll(list.map((model) => Project.fromJson(model)).toList());
    return projects;
  }
  
  Set<String> getAllProjectType(List<Project> projects) {
    var projectTypes = Set<String>();
    projects.forEach((element) => projectTypes.add(element.projectType));
    return projectTypes;
  }


}
