import 'package:flutter/cupertino.dart';

abstract class IProject {
  int id;
  String name;
  String content;
  String language;
  String projectType;
  String specialLink;

  IProject({@required this.id, @required this.name, @required this.content,@required this.language,@required this.projectType,@required this.specialLink});

}