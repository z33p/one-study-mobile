import 'package:one_study_mobile/screens/list_flashcards/list_flashcards_state.dart';
import 'package:one_study_mobile/services/card_service.dart';

class ListFlashCardsBloc {
  final ListFlashCardsState state;

  ListFlashCardsBloc(this.state);

  final cardService = new CardService();

  loadCardsList() async {
    state.cards.value = await cardService.getCards();
  }
}
