import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/create_deck/create_deck_bloc.dart';
import 'package:one_study_mobile/screens/create_deck/create_deck_state.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

class CreateDeckScreen extends StatelessWidget {
  final state = new CreateDeckState();

  Widget build(BuildContext context) {
    var createDeckBloc = new CreateDeckBloc(state);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Decks"),
      ),
      body: StateProvider<CreateDeckState>(
        state: state,
        child: Form(
          key: state.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          maxLength: 20,
                          controller: state.inputTitleController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: "Title",
                          ),
                        ),
                        TextFormField(
                          maxLength: 20,
                          controller: state.inputDescriptionController,
                          decoration: InputDecoration(
                            labelText: "Description",
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => createDeckBloc.submitDeck(context),
                          child: Text("Create"),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
