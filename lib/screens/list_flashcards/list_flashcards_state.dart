import 'package:one_study_mobile/screens/shared/custom_providers/state_provider.dart';

import 'list_flashcards_bloc.dart';

class ListFlashCardsState extends MyState {
  ListFlashCardsBloc listFlashCardsBloc = new ListFlashCardsBloc();

  ListFlashCardsState();

  @override
  ListFlashCardsState createInstance() {
    var instance = new ListFlashCardsState();

    return instance;
  }
}
