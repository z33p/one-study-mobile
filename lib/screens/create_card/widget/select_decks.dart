import 'package:flutter/material.dart';
import 'package:one_study/models/deck.dart';
import 'package:one_study/screens/create_card/create_card_state.dart';

class SelectDecks extends StatelessWidget {
  const SelectDecks({Key? key, required this.state}) : super(key: key);

  final CreateCardsState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text("Decks"),
                    ),
                    children: [
                      ValueListenableBuilder<List<Deck>>(
                        valueListenable: state.decks,
                        builder: (context, decks, _) => Column(
                          children: decks
                              .map(
                                (deck) => ListTile(
                                  title: Text(deck.title),
                                  subtitle: Text(deck.description),
                                  onTap: () {
                                    state.deckSelected.value = deck;
                                    Navigator.of(context).pop();
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ValueListenableBuilder<Deck?>(
                    valueListenable: state.deckSelected,
                    builder: (context, deck, _) {
                      if (deck == null) return Text("Select a deck");

                      return Text(deck.title);
                    },
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
