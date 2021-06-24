import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_bloc.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study_mobile/screens/play_flashcards/widgets/card_playable.dart';

class CardStack extends StatelessWidget {
  const CardStack({
    Key? key,
    required this.state,
    required this.bloc,
  }) : super(key: key);

  final PlayFlashCardsState state;
  final PlayFlashCardsBloc bloc;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: state.currentCardIndex,
      builder: (BuildContext context, index, _) {
        return CardPlayable(
          card: bloc.getInMemoryDeck().cards[index],
        );
      },
    );
  }
}
