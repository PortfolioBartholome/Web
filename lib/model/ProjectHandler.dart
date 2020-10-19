import 'Project.dart';

class ProjectHandler {
  List<Project> projects;

  List<Project> fromJsonToList(Map<String, dynamic> json) {
    var projects = json as List;
    return projects.map((i) => Project.fromJson(i)).toList();
  }
}