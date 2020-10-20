import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/controller/CardContainerController.dart';
import 'package:portfolio_web/controller/CategoryController.dart';
import 'package:portfolio_web/controller/ProjectController.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/model/ProjectType.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CardContainer.dart';

class CategorySelector extends StatelessWidget {
  final ContainerSizer sizer;
  final SettingsManager settingsManager;
  final List<Project> projects;

  CategorySelector(this.sizer, this.settingsManager, this.projects);


  @override
  Widget build(BuildContext context) {
    List<CardContainer> widgets = CardContainerController().convertListProjectToListCardContainer(projects: projects, settingsManager: settingsManager);
    Set<String> projectTypes = ProjectController().getAllProjectType(projects);
    List<Row> rows = CategoryController().createListWidgetOverProjectAndProjectType(projectType: projectTypes, projects: widgets, sizer: this.sizer);
    return Card(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: rows,
      ),
    );
  }
}
