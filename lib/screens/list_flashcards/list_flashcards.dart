import 'package:flutter/material.dart';
import 'package:one_study/models/card.dart' as Models;
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';

import 'list_flashcards_state.dart';

class ListFlashCards extends StatelessWidget {
  final state = new ListFlashCardsState();

  initState() {
    state.loadCardsList();
  }

  @override
  Widget build(BuildContext context) {

    return StateProvider<ListFlashCardsState>(
      state: state,
      onInitState: initState,
      child: ValueListenableBuilder<List<Models.Card>>(
        valueListenable: state.cards,
        builder: (BuildContext context, cards, _) => ListView(
          children: [
            ...cards
                .map((card) => ListTile(
                      title: Text(card.front),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(card.back),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Score: ${card.score.toStringAsFixed(2)}",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                      isThreeLine: true,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}
