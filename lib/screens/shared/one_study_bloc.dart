import 'dart:async';

/// [OneStudyBloc] encapsulates getters and setters generating a single point of failure
/// where the application state can only be modified by the same method.
///
/// If you need to apply business rules in [setValue] you can implement this class in another class
/// and override the behavior of this method.
class OneStudyBloc<T> {
  T _value;

  OneStudyBloc(this._value);

  T get value => _value;

  final _valueStreamController = StreamController<T>.broadcast();
  Stream<T> get stream => _valueStreamController.stream;

  void setValue(T value) {
    _value = value;
    _valueStreamController.add(value);
  }
}
