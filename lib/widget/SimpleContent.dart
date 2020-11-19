import 'package:flutter/material.dart';
import 'package:portfolio_web/widget/FormattedPortfolioContent.dart';

class SimpleContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: FormattedPortfolioContent(),
          ),
        ],
      ),
    );
  }
}
