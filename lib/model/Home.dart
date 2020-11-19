import 'package:flutter/cupertino.dart';

class Home {
  int id;
  String content;
  String imagePath;
  String specialLink;

  Home({@required this.id, @required this.content,@required this.imagePath,@required this.specialLink});

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
        id: json['id'],
        content: json['body'],
        imagePath: json['imagePath'],
        specialLink: json['specialLink']
    );
  }

  @override
  String toString() {
    return 'Home{id: $id, content: $content, imagePath: $imagePath, specialLink: $specialLink}';
  }
}