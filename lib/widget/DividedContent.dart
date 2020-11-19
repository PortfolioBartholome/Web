import 'package:flutter/material.dart';
import 'package:portfolio_web/widget/FormattedPortfolioContent.dart';

class DividedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child:  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: FormattedPortfolioContent(),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          child: VerticalDivider(
            thickness: 2,
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          width: MediaQuery.of(context).size.width / 2 - 20,
        )
      ],
    ));
  }
}
