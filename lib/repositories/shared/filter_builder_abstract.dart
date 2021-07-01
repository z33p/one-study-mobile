import 'package:one_study/models/shared/entity_abstract.dart';
import 'package:one_study/repositories/shared/filter_abstract.dart';

abstract class FilterBuilderAbstract<F extends FilterBuilderAbstract<F>> {
  F? _instance;

  F get instance {
    const errorMsg =
        "Filter instance must be initialized, you can initialize by setting in the subclass constructor the property [instance] from [super] to [this]";

    if (_instance == null) throw (errorMsg);

    return _instance!;
  }

  set instance(F instance) {
    _instance = instance;
  }

  int? _id;

  int? get id => _id;

  F setId(int id) {
    this._id = id;

    return instance;
  }

  List<String>? _columns;

  List<String>? get columns => _columns;

  F setColumns(List<String> columns) {
    this._columns = columns;

    return instance;
  }

  String _orderByColumn = EntityAbstract.createdAtColumn;

  String get orderByColumn => _orderByColumn;

  F setOrderByColumn(String orderByColumn) {
    this._orderByColumn = orderByColumn;

    return instance;
  }

  int? _limit;

  int? get limit => _limit;

  F setLimit(int limit) {
    this._limit = limit;
    return instance;
  }

  int? _offset;

  int? get offset => _offset;

  F setOffset(int offset) {
    this._offset = offset;
    return instance;
  }

  FilterAbstract build();
}
