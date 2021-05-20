import 'package:flutter/material.dart';

abstract class MyState {
  MyState createInstance();
}

// ignore: must_be_immutable
class StateProvider<T extends MyState> extends StatefulWidget {
  T? _state;
  late T Function() _createInstance;

  Widget child;

  StateProvider({
    Key? key,
    required T state,
    required this.child,
  })   : _state = state,
        super(key: key) {
    _createInstance = state.createInstance as T Function();
  }

  static StateProvider<T> of<T extends MyState>(BuildContext context) {
    var widget = context.findAncestorWidgetOfExactType<StateProvider<T>>();

    var className = widget.runtimeType.toString();
    assert(widget != null, "Not found inherited widget: $className");

    return widget!;
  }

  T get state {
    if (_state == null) _state = _createInstance();

    return _state!;
  }

  void dispose() {
    _state = null;
  }

  @override
  State<StatefulWidget> createState() => _MyProvider();
}

class _MyProvider extends State<StateProvider> {
  @override
  void dispose() {
    super.dispose();
    widget.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
