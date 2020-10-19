import 'package:flutter/cupertino.dart';

import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  // Bloc en question
  final T bloc;
  // Child va s'occuper du bloc
  final Widget child;

  BlocProvider({@required this.bloc, @required this.child});

  static Type _providerType<T>() => T;

  static T of<T extends Bloc>(BuildContext context){
    final type = _providerType<BlocProvider<T>>();
    final BlocProvider<T> provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BocProviderState();
}
class _BocProviderState extends State<BlocProvider>{
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }
}