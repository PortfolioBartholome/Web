import 'package:flutter/cupertino.dart';

class Knowledge {
  int id;
  String name;
  String content;
  String language;
  String projectType;
  String specialLink;

  Knowledge({@required this.id, @required this.name, @required this.content,@required this.language,@required this.projectType,@required this.specialLink});

  factory Knowledge.fromJson(Map<String, dynamic> json) {
    return Knowledge(
        id: json['id'],
        name: json['title'],
        content: json['body'],
        language: json['language'],
        projectType: json['projectType'],
        specialLink: json['specialLink']
    );
  }
}
