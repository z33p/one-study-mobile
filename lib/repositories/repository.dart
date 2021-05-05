import 'package:one_study_mobile/database/my_database.dart';
import 'package:one_study_mobile/models/shared/entity.dart';
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

  Future<List<Map<String, dynamic>>> findBy<E extends Entity>({
    required FilterAbstract filter,
  }) async {
    var entities = await dbInstance.rawQuery(filter.rawQuery);

    return entities;
  }

  Future<int> insert<E extends Entity>(E entity) async {
    var now = DateTime.now();

    entity.createdAt = now;
    entity.updatedAt = now;

    var id = await dbInstance.insert(entity.dbTable.tableName, entity.toMap());

    return id;
  }

  void update<E extends Entity>(E updatedEntity) async {
    var updatedEntityMap = updatedEntity.toMap();

    dbInstance.update(
      updatedEntity.dbTable.tableName,
      updatedEntityMap,
      where: SqlSnippets.whereEntityPkEquals(updatedEntity),
    );
  }

  void delete<E extends Entity>(E entity) async {
    await dbInstance.delete(
      entity.dbTable.tableName,
      where: SqlSnippets.whereEntityPkEquals(entity),
    );
  }
}
