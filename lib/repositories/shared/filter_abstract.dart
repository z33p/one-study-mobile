import 'package:one_study_mobile/models/shared/db_table_abstract.dart';
import 'package:one_study_mobile/repositories/shared/sql_snippets.dart';

abstract class FilterAbstract {
  int? _id;
  int? get id => _id;

  List<String>? _columns;
  List<String>? get columns => _columns;

  int? _limit;
  int? get limit => _limit;

  int? _offset;
  int? get offset => _offset;

  String? _orderByColumn;
  String? get orderByColumn => _orderByColumn;

  final DbTableAbstract table;

  String? _rawQuery;

  String get rawQuery {
    if (_rawQuery == null) _rawQuery = _buildRawQuery();

    return _rawQuery!;
  }

  FilterAbstract(
    this.table,
    this._id,
    this._columns,
    this._orderByColumn,
    this._offset,
    this._limit,
  );

  String _buildRawQuery() {
    final sqlColumns = SqlSnippets.getSqlColumns(this._columns);
    final wheres = getWheres();
    final orderBy = SqlSnippets.orderBy(this.orderByColumn);

    var baseQuery = """
      SELECT
        $sqlColumns
      FROM
        ${table.tableName}
      $wheres
      $orderBy
      
    """;

    return baseQuery;
  }

  List<String> getWheres() {
    var wheres = <String>[];

    if (id != null)
      wheres.add(
        SqlSnippets.wherePkEquals(table.idColumn, id!),
      );

    return wheres;
  }
}
