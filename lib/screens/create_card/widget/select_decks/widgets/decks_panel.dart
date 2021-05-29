import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/deck.dart';
import 'package:one_study_mobile/screens/create_card/create_cards_state.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'deck_chip.dart';

class DecksPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = StateProvider.of<CreateCardsState>(context).state;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder<List<Deck>>(
        valueListenable: state.decks,
        builder: (BuildContext context, decks, _) {
          return Wrap(
            spacing: 32.0,
            children: decks
                .map((deck) => DeckChip(
                      label: deck.title,
                      value: deck.deckId!,
                      deckSelected: state.deckSelected,
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}
