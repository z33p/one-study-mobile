import 'package:one_study_mobile/models/shared/db_table_abstract.dart';
import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';

abstract class FilterBuilderAbstract {
  int? get id;
  FilterBuilderAbstract setId(int id);

  List<String>? get columns;
  FilterBuilderAbstract setColumns(List<String> columns);

  String get orderByColumn;
  FilterBuilderAbstract setOrderByColumn(String orderByColumn);

  FilterBuilderAbstract setOrderBy(
    String Function(DbTableAbstract table) callback,
  );

  int? get limit;
  FilterBuilderAbstract setLimit(int limit);

  int? get offset;
  FilterBuilderAbstract setOffset(int offset);

  FilterAbstract build();
}
