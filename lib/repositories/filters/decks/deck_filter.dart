import 'package:one_study/models/tables/deck_table.dart';
import 'package:one_study/repositories/shared/filter_abstract.dart';

class DeckFilter extends FilterAbstract {
  DeckFilter(
    int? id,
    List<String>? columns,
    String? orderByColumn,
    int? offset,
    int? limit,
  ) : super(
          DeckTable.instance,
          id,
          columns,
          orderByColumn,
          offset,
          limit,
        );
}
