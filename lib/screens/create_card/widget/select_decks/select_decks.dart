import 'package:flutter/material.dart';

import 'widgets/decks_panel.dart';

class SelectDecks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.0),
      child: DecksPanel(),
    );
  }
}
