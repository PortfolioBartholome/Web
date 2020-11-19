import 'package:flutter/cupertino.dart';

class Project {
  int id;
  String name;
  String content;
  String language;
  String imagePath;
  String specialLink;

  Project({@required this.id, @required this.name, @required this.content,@required this.language,@required this.imagePath,@required this.specialLink});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        id: json['id'],
        name: json['name'],
        content: json['content'],
        language: json['language'],
        imagePath: json['imagePath'],
        specialLink: json['specialLink']
    );
  }

  @override
  String toString() {
    return 'Project{id: $id, name: $name, content: $content, language: $language, imagePath: $imagePath, specialLink: $specialLink}';
  }
}
