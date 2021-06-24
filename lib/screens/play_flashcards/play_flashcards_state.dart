import 'dart:async';
import 'dart:math';

import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/shared/one_study_bloc.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';
import 'package:one_study_mobile/services/card_service.dart';
import 'package:one_study_mobile/services/deck_service.dart';

class PlayFlashCardsState extends MyState {
  final _cardService = new CardService();
  final _deckService = new DeckService();

  final deck = _DeckBloc();

  final isEndOfStack = OneStudyBloc<bool>(true);
  final isFlipped = OneStudyBloc<bool>(false);

  final angle = OneStudyBloc<double>(0.0);

  final currentCardIndex = OneStudyBloc<int>(0);

  @override
  PlayFlashCardsState createInstance() => new PlayFlashCardsState();

  unFlipCard() {
    isFlipped.setValue(false);
    angle.setValue(0.0);
  }

  flipCard() {
    isFlipped.setValue(!isFlipped.value);
    angle.setValue((angle.value + pi) % (2 * pi));
  }

  setIsEndOfStack(bool isEndOfStack) {
    if (isEndOfStack) currentCardIndex.setValue(0);

    this.isEndOfStack.setValue(isEndOfStack);
  }

  generateInMemoryDeck() async {
    var deck = await _deckService.generateInMemoryDeck();

    this.deck.setValue(deck);

    if (deck.cards.length > 0) setIsEndOfStack(false);

    // TODO: Else show snackbar saying there are no cards and asking to add new ones
  }

  previous() {
    final deck = this.deck.getInMemorySafe();
  
    if ((deck.cards.length - 1) == currentCardIndex.value) {
      setIsEndOfStack(false);
      currentCardIndex.setValue(currentCardIndex.value - 1);
    } else if (currentCardIndex.value > 0) {
      currentCardIndex.setValue(currentCardIndex.value - 1);
    }
  }

  next(CardScoreFeedbackEnum cardScoreFeedback) async {
    unFlipCard();

    final deck = this.deck.getInMemorySafe();
    final index = currentCardIndex.value;

    await _cardService.setCardScore(
      cardScoreFeedback,
      deck.cards[currentCardIndex.value],
    );

    if ((deck.cards.length - 1) != index)
      currentCardIndex.setValue(currentCardIndex.value + 1);
    else
      setIsEndOfStack(true);
  }
}

class _DeckBloc implements OneStudyBloc<Deck?> {
  Deck? _deck;

  @override
  get value => _deck;

  Deck getInMemorySafe() {
    if (_deck == null) throw Exception("In memory deck is null");

    return _deck!;
  }

  final _deckStreamController = StreamController<Deck?>.broadcast();

  @override
  Stream<Deck?> get stream => _deckStreamController.stream;

  @override
  void setValue(value) {
    _deck = value;
  }
}
