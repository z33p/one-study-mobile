import 'dart:math';

import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study_mobile/services/card_service.dart';
import 'package:one_study_mobile/services/deck_service.dart';

class PlayFlashCardsBloc {
  final PlayFlashCardsState _state;

  PlayFlashCardsBloc(this._state);

  var _cardService = new CardService();
  final _deckService = new DeckService();

  unFlipCard() {
    _state.isFlipped.value = false;
    _state.angle.value = 0.0;
  }

  flipCard() {
    _state.isFlipped.value = !_state.isFlipped.value;
    _state.angle.value = (_state.angle.value + pi) % (2 * pi);
  }

  setIsEndOfStack(bool isEndOfStack) {
    _state.isEndOfStack.value = isEndOfStack;
  }

  Deck getInMemoryDeck() {
    if (_state.deck.value != null) return _state.deck.value!;

    throw Exception("In Memory Deck doesn't exist");
  }

  generateInMemoryDeck() async {
    var deck = await _deckService.generateInMemoryDeck();

    _state.deck.value = deck;
    if (deck.cards.length > 0) setIsEndOfStack(false);

    // TODO: Else show snackbar saying there are no cards and asking to add new ones
  }

  previous() {
    final deck = getInMemoryDeck();

    if ((deck.cards.length - 1) == _state.currentCardIndex.value) {
      setIsEndOfStack(false);
      _state.currentCardIndex.value--;
    } else if (_state.currentCardIndex.value > 0)
      _state.currentCardIndex.value--;
  }

  next(CardScoreFeedbackEnum cardScoreFeedback) async {
    unFlipCard();

    final deck = getInMemoryDeck();
    final index = _state.currentCardIndex.value;

    await _cardService.setCardScore(
      cardScoreFeedback,
      deck.cards[_state.currentCardIndex.value],
    );

    if ((deck.cards.length - 1) != index)
      _state.currentCardIndex.value = index + 1;
    else
      setIsEndOfStack(true);
  }
}
