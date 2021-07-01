import 'package:one_study/models/tables/card_table.dart';
import 'package:one_study/repositories/shared/filter_abstract.dart';
class CardFilter extends FilterAbstract {
  CardFilter(
    int? id,
    List<String>? columns,
    String? orderByColumn,
    int? offset,
    int? limit,
  ) : super(
          CardTable.instance,
          id,
          columns,
          orderByColumn,
          offset,
          limit,
        );
}
