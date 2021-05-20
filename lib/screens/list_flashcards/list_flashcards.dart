import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/card.dart' as Models;
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'list_flashcards_state.dart';

class ListFlashCards extends StatefulWidget {
  @override
  _ListFlashCardsState createState() => _ListFlashCardsState();
}

class _ListFlashCardsState extends State<ListFlashCards> {
  ListFlashCardsState state = new ListFlashCardsState();

  @override
  Widget build(BuildContext context) {
    return StateProvider<ListFlashCardsState>(
      state: state,
      child: StreamBuilder<List<Models.Card>>(
        stream: state.listFlashCardsBloc.cardsStream,
        builder: (context, snapshot) {
          var cards = snapshot.data == null ? <Models.Card>[] : snapshot.data!;

          return ListView(
            children: [
              ...cards
                  .map((card) => ListTile(
                        title: Text(card.front),
                        subtitle: Text(card.back),
                      ))
                  .toList(),
            ],
          );
        },
      ),
    );
  }
}
