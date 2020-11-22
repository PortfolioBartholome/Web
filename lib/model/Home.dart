import 'package:flutter/cupertino.dart';

import 'APIElement.dart';

class Home extends APIElement{
  int id;
  String content;
  String specialLink;
  String imagePath;

  Home(
      {@required this.id,
        @required this.content,
        @required this.imagePath,
        @required this.specialLink})
      : super(
      id: id,
      content: content,
      specialLink: specialLink,
      imagePath: imagePath,
      type: "Home");

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