import 'package:one_study_mobile/screens/blocs/list_flashcards_bloc/list_flashcards_bloc.dart';
import 'package:one_study_mobile/screens/ui/shared/custom_providers/state_provider.dart';

class ListFlashCardsState extends MyState {
  ListFlashCardsBloc listFlashCardsBloc = new ListFlashCardsBloc();

  ListFlashCardsState();

  @override
  ListFlashCardsState createInstance() {
    var instance = new ListFlashCardsState();

    return instance;
  }
}
