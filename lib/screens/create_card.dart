import "package:flutter/material.dart";

class CreateCard extends StatefulWidget {
  @override
  _CreateCardState createState() => _CreateCardState();
}

class _CreateCardState extends State<CreateCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Cards"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home_filled),
        onPressed: () {},
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
