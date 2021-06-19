import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/card.dart' as Models;
import 'package:one_study_mobile/screens/list_flashcards/list_flashcards_bloc.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'list_flashcards_state.dart';

class ListFlashCards extends StatelessWidget {
  final state = new ListFlashCardsState();

  initState(ListFlashCardsBloc listFlashCardsBloc) {
    listFlashCardsBloc.loadCardsList();
  }

  @override
  Widget build(BuildContext context) {
    var listFlashCardsBloc = new ListFlashCardsBloc(state);

    return StateProvider<ListFlashCardsState>(
      state: state,
      onInitState: () => initState(listFlashCardsBloc),
      child: ValueListenableBuilder<List<Models.Card>>(
        valueListenable: state.cards,
        builder: (BuildContext context, cards, _) => ListView(
          children: [
            ...cards
                .map((card) => ListTile(
                      title: Text(card.front),
                      subtitle: Text(card.back),
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
