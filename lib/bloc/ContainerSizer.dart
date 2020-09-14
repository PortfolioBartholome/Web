import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'bloc.dart';

class ContainerSizer extends Bloc {
  final StreamController<List<Widget>> _size = StreamController<List<Widget>>();
  final List<Widget> containers = new List<Widget>();

  // Input
  Sink<List<Widget>> get sink => _size.sink;

  // Output
  Stream<List<Widget>> get stream => _size.stream;

  ContainerSizer() {
    sink.add(containers);
  }

  increaseSize(Widget widget) {
    containers.add(widget);
    sink.add(containers);
  }

  decreaseSize(Widget widget) {
    if (containers.contains(widget)) {
      containers.remove(widget);
      sink.add(containers);
    }
  }

  @override
  dispose() => _size.close();
}
