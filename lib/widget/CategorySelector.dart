import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/bloc/bloc_category.dart';
import 'package:portfolio_web/controller/CardContainerController.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'package:portfolio_web/widget/CheckBoxCategory.dart';

import 'CardContainerProject.dart';

class CategorySelector extends StatelessWidget {
  final ContainerSizer sizer;
  final SettingsManager settingsManager;
  final List<Project> projects;

  CategorySelector(this.sizer, this.settingsManager, this.projects);


  @override
  Widget build(BuildContext context) {
    List<CardContainer> widgets = CardContainerController().convertListProjectToListCardContainer(projects: projects, settingsManager: settingsManager);
    return Card(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("About Me"),
              CheckBoxCategory(
                blocCategory: BlocCategory(),
                containerSizer: this.sizer,
                category: "knowledge",
                widgetsToPrint: widgets.where((i) => i.project.projectType == "knowledge").toList(),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Project"),
              CheckBoxCategory(
                blocCategory: BlocCategory(),
                containerSizer: this.sizer,
                category: "project",
                widgetsToPrint: widgets.where((i) => i.project.projectType == "project").toList(),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("My CV"),
              CheckBoxCategory(
                blocCategory: BlocCategory(),
                containerSizer: this.sizer,
                category: "cv",
                widgetsToPrint: widgets.where((i) => i.project.projectType == "cv").toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
