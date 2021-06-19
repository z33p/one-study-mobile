import 'package:flutter/cupertino.dart';
import 'package:one_study_mobile/models/card.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class ListFlashCardsState extends MyState {
  final cards = ValueNotifier(<Card>[]);

  @override
  ListFlashCardsState createInstance() {
    var instance = new ListFlashCardsState();

    return instance;
  }
}
