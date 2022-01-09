import "package:flutter/material.dart";
import 'package:one_study/screens/create_card/create_card_state.dart';
import 'package:one_study/screens/home/home_screen_state.dart';
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';

import 'widget/field_card_side.dart';
import 'widget/select_decks.dart';

class CreateCardScreen extends StatelessWidget {
  final state = new CreateCardsState();

  void initState() {
    state.queryDecks();
  }

  @override
  Widget build(BuildContext context) {
    final homeState = StateProvider.of<HomeScreenState>(context).state;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Cards"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home_filled),
        onPressed: () {
          homeState.changeScreenBottomNavigation(
            ListHomeScreens.PLAY_FLASHCARDS.index,
          );

          Navigator.pop(context);
        },
      ),
      body: StateProvider<CreateCardsState>(
        state: state,
        onInitState: initState,
        alwaysDispose: false,
        child: SingleChildScrollView(
          child: Container(
            height: getRealAppHeight(context),
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Form(
              key: state.formKey,
              child: Center(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FieldCardSide(
                      controller: state.inputFrontTextController,
                      labelText: "Front",
                      icon: Icons.flip_to_front_outlined,
                      autoFocus: true,
                    ),
                    FieldCardSide(
                      controller: state.inputBackTextController,
                      labelText: "Back",
                      icon: Icons.flip_to_back_outlined,
                    ),
                    SelectDecks(state: state),
                    Center(
                      child: ElevatedButton(
                        onPressed: () => state.submitCard(context),
                        child: Text("Create"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static double getRealAppHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.vertical -
        AppBar().preferredSize.height;
  }
}
