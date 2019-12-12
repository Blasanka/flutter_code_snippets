class DataModel {
  final String id;
  final String name;

  DataModel(this.name, this.id);

  DataModel.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        id = jsonMap['_id'];

  Map toMapData() {
    var mapGroup = new Map<String, dynamic>();
    mapGroup["name"] = name;
    mapGroup['_id'] = id;
    return mapGroup;
  }
}
