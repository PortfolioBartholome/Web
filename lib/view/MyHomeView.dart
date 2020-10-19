import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/model/Project.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'package:portfolio_web/widget/CardSelector.dart';
import 'package:portfolio_web/widget/NoData.dart';

class MyHomeView extends StatelessWidget {
  final ContainerSizer containerSizer = ContainerSizer();
  final SettingsManager settingsManager = SettingsManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Project>>(
        future: settingsManager.instantiateConfigurationAndGetAllProject(
            context: context),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return NoData();
          } else {
            return Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      CardSelector(
                        sizer: containerSizer,
                        settingsManager: settingsManager,
                        projects: snapshot.data,
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 7,
                  child: StreamBuilder<List<CardContainer>>(
                    stream: containerSizer.stream,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<CardContainer>> snapshot) {
                      return snapshot.data != null
                          ? Row(
                              children: snapshot.data,
                            )
                          : Row(
                              children: [
                              ],
                            );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
