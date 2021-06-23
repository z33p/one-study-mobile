import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:one_study_mobile/models/tables/deck_table.dart';
import 'package:one_study_mobile/repositories/shared/filter_builder_abstract.dart';

import 'deck_filter.dart';

class DeckFilterBuilder extends FilterBuilderAbstract {
  int? _id;

  @override
  int? get id => _id;

  @override
  DeckFilterBuilder setId(int id) {
    this._id = id;

    return this;
  }

  List<String>? _columns;

  @override
  List<String>? get columns => _columns;

  @override
  DeckFilterBuilder setColumns(List<String> columns) {
    this._columns = columns;

    return this;
  }

  String _orderByColumn = EntityAbstract.createdAtColumn;

  @override
  String get orderByColumn => _orderByColumn;

  @override
  DeckFilterBuilder setOrderByColumn(String orderByColumn) {
    this._orderByColumn = orderByColumn;

    return this;
  }

  @override
  DeckFilterBuilder setOrderBy(
    String Function(DeckTable deckTable) callback,
  ) {
    this._orderByColumn = callback(DeckTable.instance);

    return this;
  }

  int? _limit;

  @override
  int? get limit => _limit;

  @override
  DeckFilterBuilder setLimit(int limit) {
    this._limit = limit;
    return this;
  }

  int? _offset;

  @override
  int? get offset => _offset;

  @override
  DeckFilterBuilder setOffset(int offset) {
    this._offset = offset;
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
