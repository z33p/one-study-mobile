import 'package:one_study_mobile/models/tables/card_table.dart';
import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';

class CardFilter implements FilterAbstract {
  @override
  final String tableName = CardTable.instance.tableName;

  @override
  int? id;

  @override
  List<String>? columns;

  @override
  int? limit;

  @override
  int? offset;

  @override
  bool? distinct;

  @override
  String? groupBy;

  @override
  String? having;

  @override
  String? orderBy;

  @override
  DateTime? createdAt;

  @override
  DateTime? updatedAt;

  @override
  String generateSqlQuery() {
    // TODO: implement whereEqualsSql
    throw UnimplementedError();
  }
}
