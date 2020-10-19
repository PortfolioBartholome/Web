import 'package:flutter/material.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CardContainerKnowledge.dart';
import 'package:portfolio_web/widget/CardContainerProject.dart';

import 'CardContainerCV.dart';

class CardContainer extends StatelessWidget {
  final SettingsManager settingsManager;
  final Project project;

  CardContainer(
      {@required this.settingsManager, @required this.project});

  @override
  Widget build(BuildContext context) {
    return project.projectType == "project" ? CardContainerProject(project: project, settingsManager: settingsManager)
        : project.projectType == "cv" ? CardContainerCV(project: project, settingsManager: settingsManager)
        : CardContainerKnowledge(project: project, settingsManager: settingsManager);
  }
}