import 'dart:async';
import 'package:flutter/cupertino.dart';

class ContainerSizer {
  StreamController<List<Widget>> _size;
  List<Widget> containers;

  ContainerSizer() {
    _size = StreamController<List<Widget>>.broadcast();
    containers = new List<Widget>();
    _size.add(containers);
  }

  increaseSize(Widget widget) {
    containers.add(widget);
    _size.add(containers);
  }
  decreaseSize(Widget widget){
    if(containers.contains(widget)) {
      containers.remove(widget);
      _size.add(containers);
    }
  }


  Stream<List<Widget>> getSize() => _size.stream;

}
