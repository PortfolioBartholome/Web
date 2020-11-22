import 'package:flutter/cupertino.dart';

import 'APIElement.dart';

class AboutMe extends APIElement {
  int id;
  String content;
  String specialLink;
  String imagePath;

  AboutMe(
      {@required this.id,
      @required this.content,
      @required this.imagePath,
      @required this.specialLink})
      : super(
            id: id,
            content: content,
            specialLink: specialLink,
            imagePath: imagePath,
            type: "AboutMe");

  factory AboutMe.fromJson(Map<String, dynamic> json) {
    return AboutMe(
        id: json['id'],
        content: json['content'],
        specialLink: json['specialLink'],
        imagePath: json['imagePath']);
  }
  @override
  String toString() {
    return 'AboutMe{id: $id, content: $content, specialLink: $specialLink, imagePath: $imagePath}';
  }
}
