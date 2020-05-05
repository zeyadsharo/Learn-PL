class DescriptionObjects {
  int id;
  String description;
  int objectid;

  DescriptionObjects(this.id, this.description, this.objectid);
  DescriptionObjects.map(dynamic obj) {
    this.id = obj['id'];
    this.description = obj['description'];
    this.objectid = obj['objectid'];
  }
  String get _descriptionobjects => description;
  int get _id => id;
  int get _objectid => objectid;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['description'] = _descriptionobjects;
    map['objectid'] = _objectid;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  DescriptionObjects.fromMap(Map<String, dynamic> map) {
    this.description = map['description'];
    this.objectid = map['objectid'];
    this.id = map['id'];
  }
}
