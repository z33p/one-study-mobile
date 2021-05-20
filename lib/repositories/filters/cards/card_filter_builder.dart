import 'package:one_study_mobile/models/shared/entity.dart';
import 'package:one_study_mobile/models/tables/card_table.dart';
import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';
import 'package:one_study_mobile/repositories/shared/filter_builder_abstract.dart';
import 'package:one_study_mobile/repositories/shared/sql_snippets.dart';

import 'card_filter.dart';

class CardFilterBuilder extends FilterBuilderAbstract {
  List<String>? columns;
  String? _sqlColumns = "*";

  CardFilterBuilder setColumns(List<String> columns) {
    this.columns = columns;
    if (columns.isNotEmpty) _sqlColumns = columns.join(", ");

    return this;
  }

  int? id;
  String? _whereId;

  CardFilterBuilder setId(int id) {
    this.id = id;
    _whereId = SqlSnippets.wherePkEquals(CardTable.instance.idColumn, id);

    return this;
  }

  String orderByColumn = Entity.createdAtColumn;
  CardFilterBuilder setorderByColumn(String orderByColumn) {
    this.orderByColumn = orderByColumn;
    return this;
  }

  @override
  CardFilter build() {
    var filter = CardFilter(this.rawQuery);

    return filter;
  }

  @override
  String get rawQuery {
    var wheres = SqlSnippets.sqlWheres(<String?>[_whereId]);
    var orderBy = SqlSnippets.orderBy(this.orderByColumn);

    var baseQuery = """
      SELECT
        $_sqlColumns
      FROM
        ${CardTable.instance.tableName}
      $wheres
      $orderBy
      
    """;

    return baseQuery;
  }
}
