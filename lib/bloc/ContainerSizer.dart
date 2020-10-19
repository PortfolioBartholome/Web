import 'dart:async';
import 'package:portfolio_web/widget/CardContainer.dart';
import 'package:portfolio_web/widget/CardContainerProject.dart';
import 'bloc.dart';

class ContainerSizer extends Bloc {
  final StreamController<List<CardContainer>> _size = StreamController<List<CardContainer>>();
  final List<CardContainer> containers = new List<CardContainer>();

  // Input
  Sink<List<CardContainer>> get sink => _size.sink;

  // Output
  Stream<List<CardContainer>> get stream => _size.stream;

  ContainerSizer() {
    sink.add(containers);
  }

  increaseSize(List<CardContainer> widget) {
    containers.addAll(widget);
    sink.add(containers);
  }

  decreaseSize(String type) async {
    containers.removeWhere((element) => identical(element.project.projectType, type));
    sink.add(containers);
  }

  @override
  dispose() => _size.close();
}
