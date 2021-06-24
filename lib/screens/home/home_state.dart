import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/list_flashcards/list_flashcards.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards.dart';
import 'package:one_study_mobile/screens/settings.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

enum ListHomeScreens { LIST_FLASHCARDS, PLAY_FLASHCARDS, SETTTING_SCREEN }

class HomeState extends MyState {
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

  HomeState() {
    selectedScreen = ValueNotifier(listScreens[currentIndex.value]);
  }

  @override
  HomeState createInstance() => HomeState();

  changeScreenBottomNavigation(int index) {
    currentIndex.value = index;

    selectedScreen.value = listScreens[index];

    isVisibleFloatingButton.value = (index == 0);
    isDialOpen.value = false;
  }
}
