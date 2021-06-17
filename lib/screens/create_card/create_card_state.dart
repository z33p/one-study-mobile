import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class CreateCardsState extends MyState {
  final formKey = GlobalKey<FormState>();

  final inputFrontTextController = TextEditingController();
  final inputBackTextController = TextEditingController();

  final ValueNotifier<List<Deck>> decks = ValueNotifier(<Deck>[]);

  List<ValueNotifier<int?>> decksSelectedList = <ValueNotifier<int?>>[];

  final pageViewController = PageController(initialPage: 0);

  @override
  CreateCardsState createInstance() {
    var instance = new CreateCardsState();

    return instance;
  }
}
