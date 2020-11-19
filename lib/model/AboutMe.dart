import 'package:flutter/cupertino.dart';

class AboutMe {
  int id;
  String content;
  String specialLink;
  String imagePath;

  AboutMe({@required this.id, @required this.content, @required this.imagePath ,@required this.specialLink});

  factory AboutMe.fromJson(Map<String, dynamic> json) {
    return AboutMe(
        id: json['id'],
        content: json['body'],
        specialLink: json['specialLink'],
        imagePath: json['imagePath']
    );
  }

  @override
  String toString() {
    return 'AboutMe{id: $id, content: $content, specialLink: $specialLink, imagePath: $imagePath}';
  }
}