import 'package:flutter/material.dart';

class DeckChip extends StatelessWidget {
  final String label;
  final int value;
  final ValueNotifier<int?> deckSelected;

  DeckChip({
    required this.label,
    required this.value,
    required this.deckSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int?>(
      valueListenable: deckSelected,
      builder: (BuildContext context, deckSelectedValue, _) {
        return ActionChip(
          elevation: 3,
          avatar: value == deckSelectedValue
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : null,
          backgroundColor: Colors.green,
          label: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => deckSelected.value = value,
        );
      },
    );
  }
}
