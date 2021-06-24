import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';
import 'package:one_study_mobile/services/card_service.dart';
import 'package:one_study_mobile/services/deck_service.dart';

class PlayFlashCardsState extends MyState {
  final deck = ValueNotifier<Deck?>(null);

  final isEndOfStack = ValueNotifier<bool>(true);

  final isFlipped = ValueNotifier<bool>(false);
  final angle = ValueNotifier<double>(0.0);

  final currentCardIndex = ValueNotifier<int>(0);

  @override
  PlayFlashCardsState createInstance() => new PlayFlashCardsState();

  var _cardService = new CardService();
  final _deckService = new DeckService();

  unFlipCard() {
    isFlipped.value = false;
    angle.value = 0.0;
  }

  flipCard() {
    isFlipped.value = !isFlipped.value;
    angle.value = (angle.value + pi) % (2 * pi);
  }

  setIsEndOfStack(bool isEndOfStack) {
    this.isEndOfStack.value = isEndOfStack;
  }

  Deck getInMemoryDeck() {
    if (deck.value != null) return deck.value!;

    throw Exception("In Memory Deck doesn't exist");
  }

  generateInMemoryDeck() async {
    var deck = await _deckService.generateInMemoryDeck();

    this.deck.value = deck;

    if (deck.cards.length > 0) setIsEndOfStack(false);

    // TODO: Else show snackbar saying there are no cards and asking to add new ones
  }

  previous() {
    final deck = getInMemoryDeck();

    if ((deck.cards.length - 1) == currentCardIndex.value) {
      setIsEndOfStack(false);
      currentCardIndex.value--;
    } else if (currentCardIndex.value > 0) currentCardIndex.value--;
  }

  next(CardScoreFeedbackEnum cardScoreFeedback) async {
    unFlipCard();

    final deck = getInMemoryDeck();
    final index = currentCardIndex.value;

    await _cardService.setCardScore(
      cardScoreFeedback,
      deck.cards[currentCardIndex.value],
    );

    if ((deck.cards.length - 1) != index)
      currentCardIndex.value = index + 1;
    else
      setIsEndOfStack(true);
  }
}
