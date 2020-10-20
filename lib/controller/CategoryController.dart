import 'package:flutter/cupertino.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/bloc/bloc_category.dart';
import 'package:portfolio_web/model/ProjectType.dart';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'package:portfolio_web/widget/CheckBoxCategory.dart';

class CategoryController {
  List<Row> createListWidgetOverProjectAndProjectType(
      {@required Set<String> projectType,
      @required List<CardContainer> projects,
      @required ContainerSizer sizer}) {
    var widgets = List<Row>();
    projectType.forEach((element) {print(element);});
    projectType.forEach((element) {
      widgets.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(element),
            CheckBoxCategory(
              blocCategory: BlocCategory(),
              containerSizer: sizer,
              category: element,
              widgetsToPrint: projects
                  .where((i) => i.project.projectType == element)
                  .toList(),
            ),
          ],
        ),
      );
    });
    return widgets;
  }
}
