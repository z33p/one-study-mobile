abstract class FilterAbstract {
  final String tableName;

  int? id;
  List<String>? columns;

  int? limit;
  int? offset;

  bool? distinct;
  String? groupBy;
  String? having;
  String? orderBy;

  DateTime? createdAt;
  DateTime? updatedAt;

  FilterAbstract(this.tableName);

  String generateSqlQuery();
}
