
class DescriptionObjects {
  int id;
  String descriptionobjects;
  DescriptionObjects(this.descriptionobjects);
  DescriptionObjects.map(dynamic obj) {
    this.descriptionobjects = obj['descriptionobjects'];
  }
  String get _descriptionobjects => descriptionobjects;
  int get _id => id;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['descriptionobjects'] = _descriptionobjects;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  DescriptionObjects.fromMap(Map<String, dynamic> map) {
    this.descriptionobjects = map['descriptionobjects'];
    this.id = map['id'];
  }
}
