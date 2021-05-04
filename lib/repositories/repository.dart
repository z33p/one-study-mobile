import 'package:one_study_mobile/database/my_database.dart';
import 'package:one_study_mobile/models/shared/entity.dart';
import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';
import 'package:sqflite/sqflite.dart';

class Repository {
  final Database dbInstance = MyDatabase.dbInstance;

  Future<List<Map<String, dynamic>>> findBy<E extends Entity>({
    required FilterAbstract filter,
  }) async {
    var query = filter.generateSqlQuery();

    var entities = await dbInstance.rawQuery(query);

    return entities;
  }

  Future<int> insert<E extends Entity>(E entity) async {
    var id = await dbInstance.insert(entity.dbTable.tableName, entity.toMap());

    return id;
  }

  void update<E extends Entity>(E updatedEntity) async {
    var updatedEntityMap = updatedEntity.toMap();

    dbInstance.update(
      updatedEntity.dbTable.tableName,
      updatedEntityMap,
      where: _wherePkEquals(updatedEntity),
    );
  }

  void delete<E extends Entity>(E entity) async {
    await dbInstance.delete(
      entity.dbTable.tableName,
      where: _wherePkEquals(entity),
    );
  }

  String _wherePkEquals(Entity entity) {
    var entityId = entity.toMap()[entity.dbTable.idColumn];

    var where = "${entity.dbTable.idColumn} = $entityId";

    return where;
  }
}
