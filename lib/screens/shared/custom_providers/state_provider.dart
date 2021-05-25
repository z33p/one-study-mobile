import 'package:flutter/material.dart';

abstract class MyState {
  MyState createInstance();
}

// ignore: must_be_immutable
class StateProvider<T extends MyState> extends StatefulWidget {
  T? _state;
  late T Function() _createInstance;
  Function onInitState = () {};
  Function onDispose = () {};
  final bool alwaysDispose;

  Widget child;

  StateProvider({
    Key? key,
    required T state,
    required this.child,
    this.alwaysDispose = true,
    Function? onInitState,
    Function? onDispose,
  })  : _state = state,
        super(key: key) {
    _createInstance = state.createInstance as T Function();

    if (onInitState != null) this.onInitState = onInitState;
    if (onDispose != null) this.onDispose = onDispose;
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

  void initState() {
    onInitState();
  }

  void dispose() {
    onDispose();
    if (alwaysDispose) _state = null;
  }

  @override
  State<StatefulWidget> createState() => _MyProvider();
}

class _MyProvider extends State<StateProvider> {
  @override
  void initState() {
    super.initState();
    widget.initState();
  }

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
