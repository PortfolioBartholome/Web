abstract class APIElement {
  int id;
  String name;
  String content;
  String imagePath;
  String specialLink;
  String type;
  String language;

  APIElement(
      {int id,
       this.name,
       this.content,
       this.imagePath,
       this.specialLink,
       this.type,
       this.language});

  @override
  String toString() {
    return 'Element{content: $content, imagePath: $imagePath, specialLink: $specialLink, type: $type}';
  }
}
