import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';

class CardFilter implements FilterAbstract {
  @override
  int? id;

  @override
  List<String>? columns;

  @override
  String? orderByColumn;

  @override
  int? limit;

  @override
  int? offset;

  @override
  final String rawQuery;

  CardFilter(this.rawQuery);
}
