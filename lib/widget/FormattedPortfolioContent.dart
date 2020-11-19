import 'package:flutter/material.dart';

class FormattedPortfolioContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(""
            "Lorem ipsum dolor sit amet,\n\r"
            "consectetur adipiscing elit,\n"
            "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n"
            "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n"
            "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.\n"
            "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
    );
  }
}
