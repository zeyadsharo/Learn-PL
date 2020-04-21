class DescriptionObjects {
  int id;
  String descriptionobjects;
  int lang_id;
  int concepts_id;

  DescriptionObjects(this.descriptionobjects, this.lang_id, this.concepts_id);
  DescriptionObjects.map(dynamic obj) {
    this.descriptionobjects = obj['descriptionobjects'];
    this.lang_id = obj['lang_id'];
    this.concepts_id = obj['concepts_id'];
  }
  String get _descriptionobjects => descriptionobjects;
  int get _id => id;
  int get _lang_id => lang_id;
  int get _concepts_id => concepts_id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['descriptionobjects'] = _descriptionobjects;

    map['lang_id'] = _lang_id;
    map['concepts_id'] = _concepts_id;

    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  DescriptionObjects.fromMap(Map<String, dynamic> map) {
    this.descriptionobjects = map['descriptionobjects'];
    this.lang_id = map['lang_id'];
    this.concepts_id = map['concepts_id'];
    this.id = map['id'];
  }
}
