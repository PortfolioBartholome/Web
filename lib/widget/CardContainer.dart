import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  final Color color;
  CardContainer({
    @required this.color,
  });

  @override
  State<StatefulWidget> createState() => CardContainerState();
}

class CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 5,
      child: Card(
        elevation: 8,
        child: Container(
          color: this.widget.color,
        ),
      ),
    );
  }
}
