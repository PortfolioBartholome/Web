import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CategorySelectorState();
}

class CategorySelectorState extends State<CategorySelector> {
  bool isAboutMe = false;
  bool isProject = false;
  bool isCV = false;

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
                  onChanged: (change) => setState(() => {isAboutMe = change})),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Project 2"),
              Checkbox(
                  value: isProject,
                  onChanged: (change) => setState(() => {isProject = change})),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("My CV"),
              Checkbox(
                  value: isCV,
                  onChanged: (change) => setState(() => {isCV = change})),
            ],
          ),
        ],
      ),
    );
  }
}
