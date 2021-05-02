class Model {
  DateTime? createdAt;
  DateTime? updatedAt;

  static String createdAtColumn = "created_at";
  static String updatedAtColumn = "updated_at";

  Model(this.createdAt, this.updatedAt);
  Model.make();

  static String createModelColumnsSql = """
    , $createdAtColumn TEXT
    , $updatedAtColumn TEXT
  """;

  static Model fromMap(Map<String, dynamic> modelMap) {
    var createdAt = DateTime.parse(modelMap[createdAtColumn]);
    var updatedAt = DateTime.parse(modelMap[updatedAtColumn]);

    var model = Model(createdAt, updatedAt);

    return model;
  }

  Map<String, dynamic> toMap() {
    var modelMap = Map<String, dynamic>();

    modelMap[Model.createdAtColumn] = this.createdAt.toString();
    modelMap[Model.updatedAtColumn] = this.updatedAt.toString();

    return modelMap;
  }
}
