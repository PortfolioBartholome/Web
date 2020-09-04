import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'package:portfolio_web/widget/CardSelector.dart';

class MyHomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                CardSelector()
              ],
            ),
          ),
          Flexible(
            flex: 7,
            child: Row(
              children: [
                CardContainer(color: Colors.red),
                CardContainer(color: Colors.blue),
                CardContainer(color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
