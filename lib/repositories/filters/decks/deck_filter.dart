import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';

class DeckFilter implements FilterAbstract {
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

  DeckFilter(this.rawQuery);
}
