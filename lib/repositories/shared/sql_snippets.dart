import 'package:one_study_mobile/models/shared/entity_abstract.dart';

class SqlSnippets {
  static String sqlWheres(List<String?> sqlWheresList) {
    var sqlWheres = "";

    if (sqlWheresList.any((where) => where != null))
      sqlWheres = sqlWheresList.join(" AND ");

    return sqlWheres;
  }

  static String wherePkEquals(String idColumn, int entityId) {
    var where = "$idColumn = $entityId";

    return where;
  }

  static String whereEntityPkEquals(EntityAbstract entity) {
    var entityId = entity.toMap()[entity.dbTable.idColumn];

    return wherePkEquals(entity.dbTable.idColumn, entityId);
  }

  static String orderBy([String? orderByColumn, int? limit, int? offset]) {
    var orderBy = "";

    if (orderByColumn != null && orderByColumn.isNotEmpty)
      orderBy = "ORDER BY $orderByColumn";

    if (limit != null) orderBy += " LIMIT $limit";

    if (offset != null) orderBy += " OFFSET $offset";

    return orderBy;
  }

  static String getSqlColumns(List<String>? columns) {
    String? sqlColumns = "*";

    if (columns != null && columns.isNotEmpty) sqlColumns = columns.join(", ");

    return sqlColumns;
  }
}
