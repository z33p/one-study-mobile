import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:one_study_mobile/models/tables/card_table.dart';
import 'package:one_study_mobile/repositories/filters/cards/card_filter.dart';
import 'package:one_study_mobile/repositories/shared/filter_builder_abstract.dart';

class CardFilterBuilder extends FilterBuilderAbstract {
  int? _id;

  @override
  int? get id => _id;

  @override
  CardFilterBuilder setId(int id) {
    this._id = id;

    return this;
  }

  List<String>? _columns;

  @override
  List<String>? get columns => _columns;

  @override
  CardFilterBuilder setColumns(List<String> columns) {
    this._columns = columns;

    return this;
  }

  String _orderByColumn = EntityAbstract.createdAtColumn;

  @override
  String get orderByColumn => _orderByColumn;

  @override
  CardFilterBuilder setOrderByColumn(String orderByColumn) {
    this._orderByColumn = orderByColumn;

    return this;
  }

  @override
  CardFilterBuilder setOrderBy(
    String Function(CardTable cardTable) callback,
  ) {
    this._orderByColumn = callback(CardTable.instance);

    return this;
  }

  int? _limit;

  @override
  int? get limit => _limit;

  @override
  CardFilterBuilder setLimit(int limit) {
    this._limit = limit;
    return this;
  }

  int? _offset;

  @override
  int? get offset => _offset;

  @override
  CardFilterBuilder setOffset(int offset) {
    this._offset = offset;
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
