import 'package:one_study/database/my_database.dart';
import 'package:one_study/models/shared/entity_abstract.dart';
import 'package:one_study/models/shared/pivot_table_abstract.dart';
import 'package:sqflite/sqflite.dart';

import 'shared/filter_abstract.dart';
import 'shared/sql_snippets.dart';

class Repository {
  static final Repository _repository = Repository._internal();

  factory Repository() {
    return _repository;
  }

  Repository._internal();

  final Database dbInstance = MyDatabase.dbInstance;

  Future<List<E>> findByMapped<E extends EntityAbstract>({
    required FilterAbstract filter,
    required List<E> mapFunction(List<Map<String, dynamic>> entities),
  }) async {
    var entities = await dbInstance.rawQuery(filter.rawQuery);

    return mapFunction(entities);
  }

  Future<List<Map<String, dynamic>>> findBy({
    required FilterAbstract filter,
  }) async {
    var entities = await dbInstance.rawQuery(filter.rawQuery);

    return entities;
  }

  Future<int> insert<E extends EntityAbstract>(E entity) async {
    var id = await dbInstance.insert(entity.dbTable.tableName, entity.toMap());

    return id;
  }

  Future<void> update<E extends EntityAbstract>(E updatedEntity) async {
    var updatedEntityMap = updatedEntity.toMap();

    await dbInstance.update(
      updatedEntity.dbTable.tableName,
      updatedEntityMap,
      where: SqlSnippets.whereEntityPkEquals(updatedEntity),
    );
  }

  Future<void> delete<E extends EntityAbstract>(E entity) async {
    await dbInstance.delete(
      entity.dbTable.tableName,
      where: SqlSnippets.whereEntityPkEquals(entity),
    );
  }

  Future<void> attach<E extends EntityAbstract, P extends PivotTableAbstract>({
    required P pivotTable,
    required E entity,
    required List<int> attachIdList,
  }) async {
    var otherTable = pivotTable.leftTable.tableName == entity.dbTable.tableName
        ? pivotTable.rightTable
        : pivotTable.leftTable;

    var entityId = entity.toMap()[entity.dbTable.idColumn];

    var where = """
      ${pivotTable.leftTable.idColumn} = $entityId AND ${otherTable.idColumn} IN (${attachIdList.join(",")})
    """;

    var alreadyAttached = (await dbInstance.query(
      pivotTable.tableName,
      columns: [otherTable.idColumn],
      where: where,
    ))
        .map((detachedEntityMap) => int.parse(
              detachedEntityMap[otherTable.idColumn].toString(),
            ))
        .toList();

    attachIdList.removeWhere(
      (toAttachId) =>
          alreadyAttached.any((attachedId) => attachedId == toAttachId),
    );

    if (attachIdList.isNotEmpty) {
      var sqlInsert = attachIdList.map((idToAttach) => """
        INSERT INTO ${pivotTable.tableName}(${entity.dbTable.idColumn}, ${otherTable.idColumn})
        VALUES ($entityId, $idToAttach);
      """).join("\n");

      await dbInstance.rawInsert(sqlInsert);
    }
  }

  void detach<E extends EntityAbstract>(E entity, List<int> entitiesIdList) {}
}
