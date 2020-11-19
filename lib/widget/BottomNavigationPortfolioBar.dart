import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/bloc_menu.dart';
import 'package:portfolio_web/model/MenuSelected.dart';

class BottomNavigationPortfolioBar extends StatelessWidget {
  final int selectedIndex;
  final BlocMenu blocMenu;

  BottomNavigationPortfolioBar(
      {@required this.selectedIndex, @required this.blocMenu});

  static const List<String> labelList = ["HOME","ABOUT ME","KNOWLEDGE","PROJECT"];

  @override
  Widget build(BuildContext context) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black87,
            ),
            label: "HOME",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_mall,
              color: Colors.black87,
            ),
            label: "ABOUT ME",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.description,
              color: Colors.black87,
            ),
            label: "KNOWLEDGE",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ac_unit,
              color: Colors.black87,
            ),
            label: "PROJECT",
          ),
        ],
        currentIndex: this.selectedIndex,
        selectedItemColor: Colors.amber,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.amber,
        onTap: (index) => blocMenu
            .update(MenuSelected(index: index, title: labelList[index])),
      );
}
