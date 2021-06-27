import 'dart:async';

/// [OneStudyBloc] encapsulates getters and setters generating a single point of failure
/// where the application state can only be modified by the same method [setValue].
///
/// This class can be inherited in order to expand its functionality,
/// but the focus is on writing the business rules in services
class OneStudyBloc<T> {
  T _value;
  T Function(T value)? _transformValue;
  void Function(T value)? _onSetValue;

  /// You can use the [transformValue] to apply a function to modify the value before [setValue].
  /// Use  [onSetValue] only to apply business rules related to changes on screen,
  /// any other business rules must be in the services.
  OneStudyBloc(
    this._value, {
    void Function(T value)? onSetValue,
    T Function(T value)? transformValue,
  }) {
    _onSetValue = onSetValue;
    _transformValue = transformValue;
  }

  T get value => _value;

  final _valueStreamController = StreamController<T>.broadcast();
  Stream<T> get stream => _valueStreamController.stream;

  void setValue(T value) {
    if (_onSetValue != null) _onSetValue!(value);

    if (_transformValue != null) value = _transformValue!(value);

    _value = value;
    _valueStreamController.add(value);
  }
}
