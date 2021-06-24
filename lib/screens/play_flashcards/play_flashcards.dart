import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_bloc.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'widgets/card_stack.dart';
import 'widgets/card_stack_buttons.dart';

class PlayFlashCards extends StatelessWidget {
  final state = PlayFlashCardsState();

  @override
  Widget build(BuildContext context) {
    final bloc = PlayFlashCardsBloc(state);

    var playArea = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CardStack(state: state, bloc: bloc),
        CardStackButtons(state: state, bloc: bloc),
      ],
    );

    return StateProvider(
      state: state,
      onInitState: () {
        bloc.generateInMemoryDeck();
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ValueListenableBuilder<bool>(
          valueListenable: state.isEndOfStack,
          builder: (BuildContext context, bool stackEnded, Widget? child) {
            if (stackEnded)
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: ElevatedButton.icon(
                          onPressed: bloc.generateInMemoryDeck,
                          icon: Icon(Icons.replay_rounded),
                          label: Text("Reload"),
                        ),
                      ),
                    ],
                  )
                ],
              );

            return playArea;
          },
        ),
      ),
    );
  }
}
