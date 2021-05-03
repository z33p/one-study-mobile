import 'package:one_study_mobile/models/shared/db_table.dart';

abstract class Entity {
  DateTime? createdAt;
  DateTime? updatedAt;

  static String createdAtColumn = "created_at";
  static String updatedAtColumn = "updated_at";

  Entity(this.createdAt, this.updatedAt);
  Entity.make();

  DbTable get dbTable;

  static String entityColumnsSql = """
    , $createdAtColumn TEXT
    , $updatedAtColumn TEXT
  """;

  Map<String, dynamic> toMap();

  static Map<String, dynamic> entityToMap(Entity entity) {
    var modelMap = Map<String, dynamic>();

    modelMap[Entity.createdAtColumn] = entity.createdAt.toString();
    modelMap[Entity.updatedAtColumn] = entity.updatedAt.toString();

    return modelMap;
  }
}
