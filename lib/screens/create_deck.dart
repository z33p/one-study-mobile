import 'package:flutter/material.dart';

class CreateDeck extends StatefulWidget {
  @override
  _CreateDeckState createState() => _CreateDeckState();
}

class _CreateDeckState extends State<CreateDeck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Decks"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Go back"),
          onPressed: () {
            // Navigate to second route when tapped.
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
