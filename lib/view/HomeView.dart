import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/bloc_menu.dart';
import 'package:portfolio_web/model/APIElement.dart';
import 'package:portfolio_web/model/MenuSelected.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/BottomNavigationPortfolioBar.dart';
import 'package:portfolio_web/widget/DividedContent.dart';
import 'package:portfolio_web/widget/DividedWithGridContent.dart';
import 'package:portfolio_web/widget/NoData.dart';
import 'package:portfolio_web/widget/SimpleContent.dart';
import 'package:portfolio_web/widget/PortfolioAppBar.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SettingsManager settingsManager = SettingsManager();
    final BlocMenu blocMenu = BlocMenu(MenuSelected(index: 0, title: "HOME"));
    return StreamBuilder<MenuSelected>(
      stream: blocMenu.stream,
      builder: (BuildContext context, AsyncSnapshot<MenuSelected> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: PortfolioAppBar(
              title: "HOME",
              blocMenu: blocMenu,
            ),
            body: Container(),
            bottomNavigationBar: BottomNavigationPortfolioBar(
                selectedIndex: 0, blocMenu: blocMenu),
          );
        }
        return Scaffold(
          appBar:
              PortfolioAppBar(title: snapshot.data.title, blocMenu: blocMenu),
          body: FutureBuilder<List<APIElement>>(
            future:
                settingsManager.instantiateConfiguration(context: context),
            builder: (context, listApiElement) {
              if (listApiElement.hasData) {
                final BlocMenu blocProject = BlocMenu(MenuSelected(index: 0, title: listApiElement.data.firstWhere((element) => element.type == "Project").name));
                final BlocMenu blocKnowledge = BlocMenu(MenuSelected(index: 0, title: listApiElement.data.firstWhere((element) => element.type == "Knowledge").name));
                return IndexedStack(
                  index: snapshot.data.index,
                  children: [
                    SimpleContent(
                      type: "Home", apiElements: listApiElement.data,settingsManager: settingsManager,),
                    DividedContent(
                      type: "AboutMe", apiElements: listApiElement.data,),
                    DividedWithGridContent(
                      blocMenu: blocKnowledge,
                      apiElements: listApiElement.data,
                      type: "Knowledge",
                    ),
                    DividedWithGridContent(
                      blocMenu: blocProject,
                      apiElements: listApiElement.data,
                      type: "Project",
                    ),
                  ],
                );
              }
              else
                return NoData();
            },
          ),
          bottomNavigationBar: BottomNavigationPortfolioBar(
              selectedIndex: snapshot.data.index, blocMenu: blocMenu),
        );
      },
    );
  }
}
