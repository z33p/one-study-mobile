import 'package:one_study_mobile/models/tables/deck_table.dart';
import 'package:one_study_mobile/repositories/shared/filter_builder_abstract.dart';

import 'deck_filter.dart';

class DeckFilterBuilder extends FilterBuilderAbstract<DeckFilterBuilder> {
  DeckFilterBuilder() {
    super.instance = this;
  }

  DeckFilterBuilder setOrderBy(
    String Function(DeckTable cardTable) callback,
  ) {
    setOrderByColumn(callback(DeckTable.instance));

    return this;
  }

  @override
  DeckFilter build() {
    var filter = DeckFilter(
      this.id,
      this.columns,
      this.orderByColumn,
      this.offset,
      this.limit,
    );

    return filter;
  }
}
