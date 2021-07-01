import 'package:one_study/models/tables/card_table.dart';
import 'package:one_study/repositories/filters/cards/card_filter.dart';
import 'package:one_study/repositories/shared/filter_builder_abstract.dart';

class CardFilterBuilder extends FilterBuilderAbstract<CardFilterBuilder> {
  CardFilterBuilder() {
    super.instance = this;
  }

  CardFilterBuilder setOrderBy(
    String Function(CardTable cardTable) callback,
  ) {
    setOrderByColumn(callback(CardTable.instance));

    return this;
  }

  @override
  CardFilter build() {
    var filter = CardFilter(
      this.id,
      this.columns,
      this.orderByColumn,
      this.offset,
      this.limit,
    );

    return filter;
  }
}
