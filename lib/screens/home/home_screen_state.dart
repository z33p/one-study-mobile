import 'package:flutter/material.dart';
import 'package:one_study/models/deck.dart';
import 'package:one_study/screens/list_flashcards/list_flashcards.dart';
import 'package:one_study/screens/play_flashcards/play_flashcards.dart';
import 'package:one_study/screens/settings.dart';
import 'package:one_study/screens/shared/custom_providers/state_provider.dart';
import 'package:one_study/services/deck_service.dart';

enum ListHomeScreens { LIST_FLASHCARDS, PLAY_FLASHCARDS, SETTTING_SCREEN }

class HomeScreenState extends MyState {
  @override
  HomeScreenState createInstance() => HomeScreenState();

  HomeScreenState() {
    selectedScreen = ValueNotifier(listScreens[currentIndex.value]);
  }

  // Services
  final _deckService = DeckService();

  ValueNotifier<int> currentIndex =
      ValueNotifier(ListHomeScreens.PLAY_FLASHCARDS.index);

  List<Widget> listScreens = [
    ListFlashCards(),
    PlayFlashCards(),
    SettingsScreen()
  ];

  late ValueNotifier<Widget> selectedScreen;

  ValueNotifier<bool> isVisibleFloatingButton = ValueNotifier(false);
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  changeScreenBottomNavigation(int index) {
    currentIndex.value = index;

    selectedScreen.value = listScreens[index];

    isVisibleFloatingButton.value = (index == 1);
    isDialOpen.value = false;
  }

  final inputDeckTitleController = TextEditingController();

  Future submitDeck(BuildContext context) async {
    // if (!formKey.currentState!.validate()) return;

    var deck = Deck.make(
      title: inputDeckTitleController.text,
      description: "",
    );

    await _deckService.create(deck);

    Navigator.of(context).pop();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Deck created"),
        duration: Duration(milliseconds: 2500),
      ),
    );

    inputDeckTitleController.clear();
  }
}
