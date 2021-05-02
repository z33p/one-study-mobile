class Entity {
  DateTime? createdAt;
  DateTime? updatedAt;

  static String createdAtColumn = "created_at";
  static String updatedAtColumn = "updated_at";

  Entity(this.createdAt, this.updatedAt);
  Entity.make();

  static String createModelColumnsSql = """
    , $createdAtColumn TEXT
    , $updatedAtColumn TEXT
  """;

  static Entity fromMap(Map<String, dynamic> modelMap) {
    var createdAt = DateTime.parse(modelMap[createdAtColumn]);
    var updatedAt = DateTime.parse(modelMap[updatedAtColumn]);

    var model = Entity(createdAt, updatedAt);

    return model;
  }

  Map<String, dynamic> toMap() {
    var modelMap = Map<String, dynamic>();

    modelMap[Entity.createdAtColumn] = this.createdAt.toString();
    modelMap[Entity.updatedAtColumn] = this.updatedAt.toString();

    return modelMap;
  }
}
