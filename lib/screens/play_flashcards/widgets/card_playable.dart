import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_study_mobile/models/card.dart' as Models;
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards_state.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class CardPlayable extends StatelessWidget {
  CardPlayable({
    Key? key,
    required this.card,
  }) : super(key: key);

  final Models.Card card;

  final cardBoxRadius = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );

  final cardTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    final state = StateProvider.of<PlayFlashCardsState>(context).state;

    return GestureDetector(
      onTap: state.flipCard,
      child: ValueListenableBuilder<double>(
        valueListenable: state.angle,
        builder: (BuildContext context, angle, _) {
          return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: state.angle.value),
            duration: Duration(milliseconds: 700),
            builder: (BuildContext context, double val, _) {
              final isFlipped = val >= (pi / 2);

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(val),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(borderRadius: cardBoxRadius),
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: isFlipped
                              ? Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.identity()..rotateY(pi),
                                  child: Text(
                                    card.back,
                                    style: cardTextStyle,
                                  ),
                                )
                              : Text(
                                  card.front,
                                  style: cardTextStyle,
                                ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
