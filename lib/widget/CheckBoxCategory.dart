import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/bloc/bloc_category.dart';
import 'package:portfolio_web/widget/CardContainer.dart';

import 'CardContainerProject.dart';

class CheckBoxCategory extends StatelessWidget {
  final BlocCategory blocCategory;
  final ContainerSizer containerSizer;
  final List<CardContainer> widgetsToPrint;
  final String category;

  CheckBoxCategory(
      {@required this.blocCategory,
      @required this.containerSizer,
      @required this.category,
      @required this.widgetsToPrint});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: blocCategory.stream,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) => Checkbox(
          value: snapshot.hasData ? snapshot.data : false,
          onChanged: (change) {
            blocCategory.updateStatus(change);
            change
                ? containerSizer.increaseSize(widgetsToPrint)
                : containerSizer.decreaseSize(category);
          }),
    );
  }
}
