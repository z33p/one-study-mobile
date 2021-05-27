import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:one_study_mobile/models/tables/deck_table.dart';
import 'package:one_study_mobile/repositories/shared/filter_builder_abstract.dart';
import 'package:one_study_mobile/repositories/shared/sql_snippets.dart';

import 'deck_filter.dart';

class DeckFilterBuilder extends FilterBuilderAbstract {
  List<String>? columns;
  String? _sqlColumns = "*";

  DeckFilterBuilder setColumns(List<String> columns) {
    this.columns = columns;
    if (columns.isNotEmpty) _sqlColumns = columns.join(", ");

    return this;
  }

  int? id;
  String? _whereId;

  DeckFilterBuilder setId(int id) {
    this.id = id;
    _whereId = SqlSnippets.wherePkEquals(DeckTable.instance.idColumn, id);

    return this;
  }

  String orderByColumn = EntityAbstract.createdAtColumn;
  DeckFilterBuilder setorderByColumn(String orderByColumn) {
    this.orderByColumn = orderByColumn;
    return this;
  }

  @override
  DeckFilter build() {
    var filter = DeckFilter(this.rawQuery);

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
        ${DeckTable.instance.tableName}
      $wheres
      $orderBy
      
    """;

    return baseQuery;
  }
}
