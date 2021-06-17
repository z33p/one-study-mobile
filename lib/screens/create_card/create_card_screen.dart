import "package:flutter/material.dart";
import 'package:one_study_mobile/screens/create_card/create_card_bloc.dart';
import 'package:one_study_mobile/screens/create_card/create_card_state.dart';
import 'package:one_study_mobile/screens/home/home_bloc.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'widget/select_decks/select_decks.dart';

class CreateCardScreen extends StatelessWidget {
  final state = new CreateCardsState();

  void initState(CreateCardsBloc createCardsBloc) {
    createCardsBloc.queryDecks();
  }

  @override
  Widget build(BuildContext context) {
    var createCardsBloc = new CreateCardsBloc(state);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Cards"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.home_filled),
        onPressed: () {
          var homeBloc = HomeBloc(context);

          homeBloc.changeScreenBottomNavigation(
            ListHomeScreens.PLAY_FLASHCARDS.index,
          );

          Navigator.pop(context);
        },
      ),
      body: StateProvider<CreateCardsState>(
        state: state,
        onInitState: () => initState(createCardsBloc),
        child: Container(
          color: Colors.grey[200],
          child: Form(
            key: state.formKey,
            child: Column(
              children: [
                Expanded(
                  flex: 11,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 4.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  maxLength: 20,
                                  controller: state.inputFrontTextController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.flip_to_front_sharp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    labelText: "Front",
                                  ),
                                ),
                                TextFormField(
                                  maxLength: 20,
                                  controller: state.inputBackTextController,
                                  decoration: InputDecoration(
                                    icon: Icon(
                                      Icons.flip_to_back_sharp,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    labelText: "Back",
                                  ),
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () =>
                                        createCardsBloc.submitCard(context),
                                    child: Text("Create"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SelectDecks(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
