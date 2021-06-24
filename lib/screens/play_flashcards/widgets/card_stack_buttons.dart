import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study_mobile/services/card_service.dart';
class CardStackButtons extends StatelessWidget {
  const CardStackButtons({
    Key? key,
    required this.state,
  }) : super(key: key);

  final PlayFlashCardsState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: StreamBuilder<bool>(
        stream: state.isFlipped.stream,
        initialData: state.isFlipped.value,
        builder: (BuildContext context, _) {
          if (state.isFlipped.value)
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () async =>
                      await state.next(CardScoreFeedbackEnum.BAD),
                  child: Text("Bad"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async =>
                      await state.next(CardScoreFeedbackEnum.GOOD),
                  child: Text("Good"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async =>
                      await state.next(CardScoreFeedbackEnum.GREAT),
                  child: Text("Great"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                ),
              ],
            );

          return MaterialButton(
            minWidth: double.infinity,
            color: Theme.of(context).primaryColor,
            onPressed: state.flipCard,
            child: Text(
              "Flip",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
