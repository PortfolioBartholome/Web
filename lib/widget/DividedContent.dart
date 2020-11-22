import 'package:flutter/material.dart';
import 'package:portfolio_web/model/APIElement.dart';
import 'package:portfolio_web/widget/FormattedPortfolioContent.dart';

class DividedContent extends StatelessWidget {
  final String type;
  final List<APIElement> apiElements;

  DividedContent({@required this.type, this.apiElements});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: FormattedPortfolioContent(apiElement: apiElements.firstWhere((apiElement) => apiElement.type == type)),
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
