import 'package:flutter/material.dart';
import 'package:one_study/models/deck.dart';
import 'package:one_study/screens/create_card/create_card_state.dart';
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';

import 'deck_chip.dart';

class DecksPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = StateProvider.of<CreateCardsState>(context).state;

    const pageSize = 6;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ValueListenableBuilder<List<Deck>>(
        valueListenable: state.decks,
        builder: (BuildContext context, decks, _) {
          var decksPages = generateDecksPages(decks, pageSize);
          state.decksSelectedList = List<ValueNotifier<int?>>.generate(
            decks.length,
            (index) => ValueNotifier(null),
          );

          return PageView(
            controller: state.pageViewController,
            children: decksPages
                .asMap()
                .entries
                .map(
                  (pageMapEntry) => Wrap(
                    spacing: 32.0,
                      children:
                        pageMapEntry.value.asMap().entries.map((deckMapEntry) {
                      var deck = deckMapEntry.value;

                      var index =
                          (deckMapEntry.key + 1) * (pageMapEntry.key + 1) - 1;

                      return DeckChip(
                        label: deck.title,
                        value: deck.deckId!,
                          deckSelected: state.decksSelectedList[index],
                      );
                    }).toList(),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }

  List<List<Deck>> generateDecksPages(List<Deck> decks, int pageSize) {
    List<List<Deck>> decksPages = [];

    var start = 0;
    while (start < decks.length) {
      var end = start + pageSize;

      if (end > decks.length) end = decks.length;

      decksPages.add(decks.getRange(start, end).toList());
      start = end;
    }

    return decksPages;
  }
}
