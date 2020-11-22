import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:portfolio_web/controller/GlobalController.dart';
import 'package:portfolio_web/model/APIElement.dart';

class SettingsManager {
  GlobalConfiguration cfg;

  Future<List<APIElement>> instantiateConfiguration({@required BuildContext context}) async {
    cfg = GlobalConfiguration();
    await GlobalConfiguration().loadFromPath("assets/cfg/settings.json");
    GlobalController globalController = GlobalController();
    return globalController.getEverything(context: context, globalConfiguration: cfg);
  }


}