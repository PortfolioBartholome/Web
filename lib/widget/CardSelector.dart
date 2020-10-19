import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/model/IProject.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CategorySelector.dart';

import 'BorderSelector.dart';

class CardSelector extends StatelessWidget {

  final ContainerSizer sizer;
  final SettingsManager settingsManager;
  final List<Project> projects;

  CardSelector({@required this.sizer, @required this.settingsManager, @required this.projects});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
      child: Container(
        child: CategorySelector(this.sizer, this.settingsManager, this.projects),
        decoration: myBoxDecoration(Colors.blue),
      ),
    );
  }
}
