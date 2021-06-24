import 'package:flutter/cupertino.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class PlayFlashCardsState extends MyState {
  final deck = ValueNotifier<Deck?>(null);

  final isEndOfStack = ValueNotifier<bool>(true);

  final isFlipped = ValueNotifier<bool>(false);
  final angle = ValueNotifier<double>(0.0);

  final currentCardIndex = ValueNotifier<int>(0);

  @override
  PlayFlashCardsState createInstance() => new PlayFlashCardsState();
}
