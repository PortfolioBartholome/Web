import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/widget/CardSelector.dart';

class MyHomeView extends StatelessWidget {

  final ContainerSizer containerSizer = ContainerSizer();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Row(
              children: [
                CardSelector(sizer: containerSizer,)
              ],
            ),
          ),
          Flexible(
            flex: 7,
            child: StreamBuilder<List<Widget>>(
              stream: containerSizer.stream,
              builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                return snapshot.data != null ? Row(
                  children: snapshot.data,
                ) : Row(children : []);
              },
            ),
          ),
        ],
      ),
    );
  }
}
