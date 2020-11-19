import 'dart:async';
import 'package:portfolio_web/model/MenuSelected.dart';

import 'bloc.dart';

class BlocMenu extends Bloc {
  final StreamController<MenuSelected> _size = StreamController<MenuSelected>();

  // Input
  Sink<MenuSelected> get sink => _size.sink;

  // Output
  Stream<MenuSelected> get stream => _size.stream;

  BlocMenu(MenuSelected menuSelected) {
    sink.add(menuSelected);
  }

  update(MenuSelected menuSelected) {
    sink.add(menuSelected);
  }

  @override
  dispose() => _size.close();
}