import 'package:flutter/cupertino.dart';

class Home {
  int id;
  String name;
  String content;
  String language;
  String projectType;
  String specialLink;

  Home({@required this.id, @required this.name, @required this.content,@required this.language,@required this.projectType,@required this.specialLink});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
        id: json['id'],
        name: json['title'],
        content: json['body'],
        language: json['language'],
        projectType: json['projectType'],
        specialLink: json['specialLink']
    );
  }
}