import 'package:flutter/material.dart';
import 'package:one_study/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';

import 'widgets/card_stack.dart';
import 'widgets/card_stack_buttons.dart';

class PlayFlashCards extends StatelessWidget {
  final state = PlayFlashCardsState();

  initState() {
    state.generateInMemoryDeck();
  }

  @override
  Widget build(BuildContext context) {
    var playArea = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CardStack(state: state),
        CardStackButtons(state: state),
      ],
    );

    return StateProvider(
      state: state,
      onInitState: initState,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: StreamBuilder<bool>(
          stream: state.isEndOfStack.stream,
          initialData: state.isEndOfStack.value,
          builder: (BuildContext context, _) {
            if (state.isEndOfStack.value)
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: ElevatedButton.icon(
                          onPressed: state.generateInMemoryDeck,
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
