import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/bloc_menu.dart';
import 'package:portfolio_web/model/MenuSelected.dart';
import 'package:portfolio_web/widget/BottomNavigationPortfolioBar.dart';
import 'package:portfolio_web/widget/DividedContent.dart';
import 'package:portfolio_web/widget/DividedWithGridContent.dart';
import 'package:portfolio_web/widget/SimpleContent.dart';
import 'package:portfolio_web/widget/PortfolioAppBar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocMenu blocMenu = BlocMenu(MenuSelected(index: 0, title: "HOME"));
    final BlocMenu blocProject = BlocMenu(MenuSelected(index: 0, title: "DART"));
    final BlocMenu blocKnowledge = BlocMenu(MenuSelected(index: 0, title: "DART"));
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
          body: IndexedStack(
            index: snapshot.data.index,
            children: [
              SimpleContent(),
              DividedContent(),
              DividedWithGridContent(
                blocMenu: blocKnowledge,
              ),
              DividedWithGridContent(
                blocMenu: blocProject,
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationPortfolioBar(
              selectedIndex: snapshot.data.index, blocMenu: blocMenu),
        );
      },
    );
  }
}
