import 'dart:async';
import 'bloc.dart';

class BlocCategory extends Bloc {
  final StreamController<bool> _size = StreamController<bool>();
  final bool status = false;

  // Input
  Sink<bool> get sink => _size.sink;

  // Output
  Stream<bool> get stream => _size.stream;

  BlocCategory() {
    sink.add(status);
  }

  updateStatus(bool status) {
    sink.add(status);
  }

  @override
  dispose() => _size.close();
}