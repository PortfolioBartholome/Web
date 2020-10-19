import 'package:flutter/cupertino.dart';
import 'package:portfolio_web/model/IProject.dart';

class Project extends IProject {
  int id;
  String name;
  String content;
  String language;
  String projectType;
  String specialLink;

  Project({@required this.id, @required this.name, @required this.content,@required this.language,@required this.projectType,@required this.specialLink});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        id: json['id'],
        name: json['name'],
        content: json['content'],
        language: json['language'],
        projectType: json['projectType'],
        specialLink: json['specialLink']
    );
  }

  @override
  String toString() {
    return 'Project{id: $id, name: $name, content: $content, language: $language, projectType: $projectType, specialLink: $specialLink}';
  }
}
