import 'package:one_study_mobile/repositories/shared/filter_abstract.dart';

abstract class FilterBuilderAbstract {
  String get rawQuery;

  FilterAbstract build();
}
