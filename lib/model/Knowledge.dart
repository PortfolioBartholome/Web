import 'package:flutter/cupertino.dart';

import 'APIElement.dart';

class Knowledge extends APIElement {
  int id;
  String name;
  String content;
  String language;
  String imagePath;
  String specialLink;

  Knowledge(
      {@required this.id,
      @required this.name,
      @required this.content,
      @required this.language,
      @required this.imagePath,
      @required this.specialLink})
      : super(
            id: id,
            name: name,
            content: content,
            language: language,
            imagePath: imagePath,
            specialLink: specialLink,
            type: "Knowledge");

  factory Knowledge.fromJson(Map<String, dynamic> json) {
    return Knowledge(
        id: json['id'],
        name: json['name'],
        content: json['content'],
        language: json['language'],
        imagePath: json['imagePath'],
        specialLink: json['specialLink']);
  }

  @override
  String toString() {
    return 'Knowledge{id: $id, name: $name, content: $content, language: $language, imagePath: $imagePath, specialLink: $specialLink}';
  }
}
