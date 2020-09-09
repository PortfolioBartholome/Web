import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_web/bloc/ContainerSizer.dart';
import 'package:portfolio_web/widget/CardContainer.dart';

class CategorySelector extends StatefulWidget {
  ContainerSizer sizer;

  CategorySelector(this.sizer);

  @override
  State<StatefulWidget> createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  bool isAboutMe = false;
  bool isProject = false;
  bool isCV = false;
  CardContainer me;
  CardContainer project;
  CardContainer cv;

  @override
  void initState() {
    super.initState();
    me = CardContainer(color: Colors.blue,size: this.widget.sizer.containers.length);
    project = CardContainer(color: Colors.red,size: this.widget.sizer.containers.length);
    cv = CardContainer(color: Colors.green,size: this.widget.sizer.containers.length);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("About Me"),
              Checkbox(
                  value: isAboutMe,
                  onChanged: (change) {
                    if (change) {
                      this.widget.sizer.increaseSize(me);
                    } else
                      this.widget.sizer.decreaseSize(me);
                    setState(() => {isAboutMe = change});
                  }),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Project 2"),
              Checkbox(
                  value: isProject,
                  onChanged: (change) {
                    if (change) {
                      this.widget.sizer.increaseSize(project);
                    } else
                      this.widget.sizer.decreaseSize(project);
                    setState(() => {isProject = change});
                  }),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("My CV"),
              Checkbox(
                  value: isCV,
                  onChanged: (change) {
                    if(change) {
                      this.widget.sizer.increaseSize(cv);
                    }
                    else
                      this.widget.sizer.decreaseSize(cv);
                    setState(() => {isCV = change});
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
