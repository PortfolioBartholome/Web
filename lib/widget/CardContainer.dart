import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/widget/BorderSelector.dart';

class CardContainer extends StatelessWidget {
  final Color color;
  final int size;
  CardContainer({
    @required this.color,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Card(
        elevation: 8,
        child: Container(
          child: Column(
            children: [
              Text(
                "Lorem ipsum dolor sit amet,"
                    " consectetur adipiscing elit,"
                    " sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
                    " Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
                    " Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
                    " Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
              ),
            ],
          ),
          decoration: myBoxDecoration(this.color),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}
