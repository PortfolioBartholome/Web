import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/bloc_menu.dart';
import 'package:portfolio_web/model/MenuSelected.dart';
import 'package:portfolio_web/widget/FormattedPortfolioContent.dart';
import 'package:portfolio_web/widget/NoData.dart';

class DividedWithGridContent extends StatelessWidget {
  final BlocMenu blocMenu;

  DividedWithGridContent({@required this.blocMenu});

  Widget square(String title, int index) {
    return RaisedButton(
      onPressed: () => this.blocMenu.update(MenuSelected(index: index, title: title)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Container(
        height: 100,
        width: 100,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(child: Text(title)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> testList2 = [];
    Widget gridview() {
      testList2.add(square("DART",0));
      testList2.add(square("FLUTTER",1));
      testList2.add(square("BLOC",2));
      testList2.add(square("TRUC",3));
      testList2.add(square("MUCHE",4));
      return Wrap(
        children: testList2,
        spacing: 20,
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 20,
          ),
          gridview(),
          Container(
            height: 20,
          ),
          StreamBuilder<MenuSelected>(
            stream: blocMenu.stream,
            builder:
                (BuildContext context, AsyncSnapshot<MenuSelected> snapshot) {
              if (!snapshot.hasData)
                return defaultRow(context);
              else
                return IndexedStack(
                  index: snapshot.data.index,
                  children: [defaultRow(context),
                    defaultRow(context),defaultRow(context),NoData(),defaultRow(context),NoData()],
                );
            },
          ),
        ],
      ),
    );
  }

  Row defaultRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: FormattedPortfolioContent(),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          child: VerticalDivider(
            thickness: 2,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          width: MediaQuery.of(context).size.width / 2 - 20,
        ),
      ],
    );
  }
}
