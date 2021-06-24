import 'package:flutter/material.dart';
import 'package:one_study_mobile/screens/home/home_bloc.dart';
import 'package:one_study_mobile/screens/list_flashcards/list_flashcards.dart';
import 'package:one_study_mobile/screens/play_flashcards/play_flashcards.dart';
import 'package:one_study_mobile/screens/settings.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

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
  HomeState createInstance() {
    var instance = HomeState();

    return instance;
  }
}
