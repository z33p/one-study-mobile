import 'package:one_study_mobile/models/shared/db_table_abstract.dart';

abstract class EntityAbstract {
  DateTime? createdAt;
  DateTime? updatedAt;

  static String createdAtColumn = "created_at";
  static String updatedAtColumn = "updated_at";

  EntityAbstract(this.createdAt, this.updatedAt);
  EntityAbstract.make();

  DbTableAbstract get dbTable;

  static String entityColumnsSql = """
    , $createdAtColumn TEXT
    , $updatedAtColumn TEXT
  """;

  Map<String, dynamic> toMap();

  static Map<String, dynamic> entityToMap(EntityAbstract entity) {
    var modelMap = Map<String, dynamic>();

    modelMap[EntityAbstract.createdAtColumn] = entity.createdAt.toString();
    modelMap[EntityAbstract.updatedAtColumn] = entity.updatedAt.toString();

    return modelMap;
  }
}
