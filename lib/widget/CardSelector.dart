import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/widget/CategorySelector.dart';

class CardSelector extends StatefulWidget {
  CardSelector();

  @override
  State<StatefulWidget> createState() => CardSelectorState();
}

class CardSelectorState extends State<CardSelector> {
  bool notOpen = false;

  @override
  Widget build(BuildContext context) {
    return notOpen
        ? Container(
            child: CategorySelector(),
          )
        : InkWell(
            child: FlutterLogo(
              size: 128,
            ),
            onTap: () => setState(
              () {
                notOpen = true;
              },
            ),
          );
  }
}
