import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/bloc_menu.dart';

class PortfolioAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final BlocMenu blocMenu;

  PortfolioAppBar({@required this.title, @required this.blocMenu});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        this.title,
        style: TextStyle(color: Colors.amber),
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(kBottomNavigationBarHeight);
}
