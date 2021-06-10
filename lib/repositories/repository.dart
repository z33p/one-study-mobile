import 'package:one_study_mobile/database/my_database.dart';
import 'package:one_study_mobile/models/shared/entity_abstract.dart';
import 'package:one_study_mobile/models/shared/pivot_table_abstract.dart';
import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';
import 'package:sqflite/sqflite.dart';

import 'shared/sql_snippets.dart';

class Repository {
  static final Repository _repository = Repository._internal();

  factory Repository() {
    return _repository;
  }

  Repository._internal();

  final Database dbInstance = MyDatabase.dbInstance;

  Future<List<Map<String, dynamic>>> findBy({
    required FilterAbstract filter,
  }) async {
    var entities = await dbInstance.rawQuery(filter.rawQuery);

    return entities;
  }

  Future<int> insert<E extends EntityAbstract>(E entity) async {
    var now = DateTime.now();

    entity.createdAt = now;
    entity.updatedAt = now;

    var id = await dbInstance.insert(entity.dbTable.tableName, entity.toMap());

    return id;
  }

  void update<E extends EntityAbstract>(E updatedEntity) async {
    var updatedEntityMap = updatedEntity.toMap();

    dbInstance.update(
      updatedEntity.dbTable.tableName,
      updatedEntityMap,
      where: SqlSnippets.whereEntityPkEquals(updatedEntity),
    );
  }

  void delete<E extends EntityAbstract>(E entity) async {
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
        VALUES ($entityId, $idToAttach)
      """).join("\n");

      await dbInstance.rawInsert(sqlInsert);
    }
  }

  void detach<E extends EntityAbstract>(E entity, List<int> entitiesIdList) {}
}
