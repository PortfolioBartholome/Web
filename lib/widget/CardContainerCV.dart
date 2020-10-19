import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'BorderSelector.dart';

class CardContainerCV extends StatelessWidget {
  final SettingsManager settingsManager;
  final Project project;

  CardContainerCV({@required this.settingsManager, @required this.project});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 3,
      child: Container(
        child: Column(
          children: [
            Text(project.content),
          ],
        ),
        decoration: myBoxDecoration(Colors.red),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
