import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/widget/CategorySelector.dart';

import 'BorderSelector.dart';

class CardSelector extends StatefulWidget {
  ContainerSizer sizer;

  CardSelector({@required this.sizer});

  @override
  State<StatefulWidget> createState() => CardSelectorState();
}

class CardSelectorState extends State<CardSelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
      child: Container(
        child: CategorySelector(this.widget.sizer),
        decoration: myBoxDecoration(Colors.blue),
      ),
    );
  }
}
