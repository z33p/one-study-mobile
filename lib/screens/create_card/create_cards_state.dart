import 'dart:async';

import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class CreateCardsState extends MyState {
  final formKey = GlobalKey<FormState>();

  final ValueNotifier<int?> deckSelected = ValueNotifier(null);
  final pageViewController = PageController(initialPage: 0);

  final inputFrontTextController = TextEditingController();
  final inputBackTextController = TextEditingController();

  final ValueNotifier<List<Deck>> decks = ValueNotifier(<Deck>[]);

  @override
  CreateCardsState createInstance() {
    var instance = new CreateCardsState();

    return instance;
  }
}
