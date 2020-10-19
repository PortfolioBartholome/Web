import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/controller/ProjectController.dart';
import 'package:portfolio_web/model/Project.dart';

class SettingsManager {
  GlobalConfiguration cfg;

  Future<List<Project>> instantiateConfigurationAndGetAllProject({@required BuildContext context}) async {
    cfg = new GlobalConfiguration();
    await GlobalConfiguration().loadFromPath("assets/cfg/settings.json");
    ProjectController projectController = ProjectController();
    return await projectController.getAllProject(context: context,globalConfiguration: cfg);
  }


}