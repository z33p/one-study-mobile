import 'package:one_study_mobile/models/tables/deck_table.dart';
import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';
import 'package:one_study_mobile/repositories/shared/sql_snippets.dart';

class DeckFilter implements FilterAbstract {
 int? _id;
  @override
  int? get id => _id;

  List<String>? _columns;
  @override
  List<String>? get columns => _columns;

  int? _limit;
  @override
  int? get limit => _limit;

  int? _offset;
  @override
  int? get offset => _offset;

  String? _orderByColumn;
  @override
  String? get orderByColumn => _orderByColumn;

  String? _rawQuery;

  String get rawQuery {
    if (_rawQuery == null) _rawQuery = _buildRawQuery();

    return _rawQuery!;
  }

  DeckFilter(
    this._id,
    this._columns,
    this._orderByColumn,
    this._offset,
    this._limit,
  );

  String _buildRawQuery() {
    final sqlColumns = getSqlColumns();
    final wheres = getWheres();
    final orderBy = SqlSnippets.orderBy(this.orderByColumn);

    var baseQuery = """
      SELECT
        $sqlColumns
      FROM
        ${DeckTable.instance.tableName}
      $wheres
      $orderBy
      
    """;

    return baseQuery;
  }

  List<String> getWheres() {
    var wheres = <String>[];

    if (id != null)
      wheres.add(
        SqlSnippets.wherePkEquals(DeckTable.instance.idColumn, id!),
      );

    return wheres;
  }

  String getSqlColumns() {
    String? sqlColumns = "*";
    
    if (columns != null && columns!.isNotEmpty)
      sqlColumns = columns!.join(", ");

    return sqlColumns;
  }
}
