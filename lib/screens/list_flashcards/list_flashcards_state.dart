import 'package:flutter/cupertino.dart';
import 'package:one_study/models/card.dart';
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';
import 'package:one_study/services/card_service.dart';

class ListFlashCardsState extends MyState {
  final _cardService = CardService();

  final cards = ValueNotifier(<Card>[]);

  @override
  ListFlashCardsState createInstance() => ListFlashCardsState();

  loadCardsList() async {
    cards.value = await _cardService.getCards();
  }
}
