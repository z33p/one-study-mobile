abstract class FilterAbstract {
  int? id;
  List<String>? columns;

  String? orderByColumn;

  int? limit;
  int? offset;


  final String rawQuery;

  FilterAbstract(this.rawQuery);
}
