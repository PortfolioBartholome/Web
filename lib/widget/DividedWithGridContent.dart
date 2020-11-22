import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/bloc_menu.dart';
import 'package:portfolio_web/model/APIElement.dart';
import 'package:portfolio_web/model/MenuSelected.dart';
import 'package:portfolio_web/widget/FormattedPortfolioContent.dart';
import 'package:portfolio_web/widget/NoData.dart';

class DividedWithGridContent extends StatelessWidget {
  final BlocMenu blocMenu;
  final List<APIElement> apiElements;
  final String type;
  
  DividedWithGridContent({@required this.blocMenu,@required this.apiElements, @required this.type});

  Widget square(String title, int index) {
    return RaisedButton(
      onPressed: () { this.blocMenu.update(MenuSelected(index: index, title: title));
      },
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
  
  List<Widget> convertAPIElementsToWidgets()
  {
    List<Widget> list = [];
    int index = 0;
    apiElements.where((element) => element.type == type).forEach((element) { 
      list.add(square(element.name, index));
      index++;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> testList2 = convertAPIElementsToWidgets();
    Widget gridview() {
      return Wrap(
        alignment: WrapAlignment.center,
        children: testList2,
        spacing: 20,
        runSpacing: 20,
      );
    }
    List<Widget> listDefaultRow = [];
    apiElements.where((element) => element.type == type).forEach((element) {listDefaultRow.add(defaultRow(context, element)); });

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
                return NoData();
              else
                return IndexedStack(
                  index: snapshot.data.index,
                  children: listDefaultRow,
                );
            },
          ),
        ],
      ),
    );
  }

  Row defaultRow(BuildContext context, APIElement apiElement) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2 - 20,
          width: MediaQuery.of(context).size.width / 2 - 20,
          child: FormattedPortfolioContent(apiElement: apiElement,),
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
