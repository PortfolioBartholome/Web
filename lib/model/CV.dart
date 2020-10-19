import 'package:flutter/cupertino.dart';
import 'package:portfolio_web/model/IProject.dart';

class CV extends IProject {
  int id;
  String name;
  String content;
  String language;
  String projectType;
  String specialLink;

  CV({@required this.id, @required this.name, @required this.content,@required this.language,@required this.projectType,@required this.specialLink});

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
        id: json['id'],
        name: json['title'],
        content: json['body'],
        language: json['language'],
        projectType: json['projectType'],
        specialLink: json['specialLink']
    );
  }
}