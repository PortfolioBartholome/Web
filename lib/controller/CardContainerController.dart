import 'package:flutter/cupertino.dart';
import 'package:portfolio_web/model/IProject.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'package:portfolio_web/widget/CardContainerProject.dart';

class CardContainerController {

  List<CardContainer> convertListProjectToListCardContainer({@required List<Project> projects, @required SettingsManager settingsManager}) {
    var widgets = List<CardContainer>();
    for(int i = 0; i < projects.length ; i++ ){
      widgets.add(CardContainer(settingsManager: settingsManager, project: projects[i]));
    }
    return widgets;
  }
}