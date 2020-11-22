import 'package:flutter/material.dart';
import 'package:portfolio_web/model/APIElement.dart';
import 'package:portfolio_web/services/SettingsManager.dart';
import 'package:portfolio_web/widget/FormattedPortfolioContent.dart';
import 'package:portfolio_web/widget/NoData.dart';

class SimpleContent extends StatelessWidget {
  final String type;
  final List<APIElement> apiElements;
  final SettingsManager settingsManager;

  SimpleContent(
      {@required this.type,
      @required this.apiElements,
      @required this.settingsManager});

  @override
  Widget build(BuildContext context) {
    APIElement apiElement =
        apiElements.firstWhere((apiElement) => apiElement.type == type);
    return Center(child : SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: FormattedPortfolioContent(apiElement: apiElement),
              ),
            ],
          ),
          apiElement.imagePath.isNotEmpty
              ? Image.network(
                  settingsManager.cfg.getValue("apiUrl") + apiElement.imagePath)
              : NoData(),
        ],
      ),
    ),);
  }
}
