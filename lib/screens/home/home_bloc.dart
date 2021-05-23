import 'package:flutter/cupertino.dart';
import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'home_state.dart';

enum ListHomeScreens { LIST_FLASHCARDS, PLAY_FLASHCARDS, SETTTING_SCREEN }

class HomeBloc {
  late HomeState state;

  HomeBloc(BuildContext context) {
    state = StateProvider.of<HomeState>(context).state;
  }

  void changeScreenBottomNavigation(int index) {
    state.currentIndex.value = index;

    state.selectedScreen.value = state.listScreens[index];

    state.isVisibleFloatingButton.value = (index == 0);
    state.isDialOpen.value = false;
  }
}
