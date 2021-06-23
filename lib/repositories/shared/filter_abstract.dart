abstract class FilterAbstract {
  int? get id;
  List<String>? get columns;

  String? get orderByColumn;

  int? get limit;
  int? get offset;

  String get rawQuery;
}
