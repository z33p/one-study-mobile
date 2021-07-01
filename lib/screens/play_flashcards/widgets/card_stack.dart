import 'package:flutter/material.dart';
import 'package:one_study/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study/screens/play_flashcards/widgets/card_playable.dart';

class CardStack extends StatelessWidget {
  const CardStack({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PlayFlashCardsState state;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: state.currentCardIndex.stream,
      initialData: state.currentCardIndex.value,
      builder: (BuildContext context, _) {
        final index = state.currentCardIndex.value;

        return CardPlayable(
          card: state.deck.getInMemorySafe().cards[index],
        );
      },
    );
  }
}
