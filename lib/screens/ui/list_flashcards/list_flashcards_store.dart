import 'package:flutter/material.dart';

class ListFlashCardsStore extends InheritedWidget {
  ListFlashCardsStore({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static String className = (ListFlashCardsStore).toString();

  static ListFlashCardsStore of(BuildContext context) {
    var result =
        context.dependOnInheritedWidgetOfExactType<ListFlashCardsStore>();

    assert(result != null, className);

    return result!;
  }
}
