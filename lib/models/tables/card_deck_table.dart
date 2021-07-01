import 'package:one_study/models/shared/pivot_table_abstract.dart';

import 'card_table.dart';
import 'deck_table.dart';

class CardDeckTable extends PivotTableAbstract {
  CardDeckTable._privateConstructor()
      : super(
          leftTable: CardTable.instance,
          rightTable: DeckTable.instance,
        );

  static final CardDeckTable _instance = CardDeckTable._privateConstructor();
  static CardDeckTable get instance => _instance;
}
