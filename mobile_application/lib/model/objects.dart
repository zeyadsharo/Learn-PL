class Objects {
  int id;
  String object;
  int concept_id;
  int lang_id;
  Objects(this.object, this.lang_id, this.concept_id);
  Objects.map(dynamic obj) {
    this.object = obj['object'];
    this.lang_id = obj['lang_id'];
    this.concept_id = obj['concept_id'];
  }
  String get _object => object;
  int get _id => id;
  int get _lang_id => lang_id;
  int get _concept_id => concept_id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['object'] = _object;
    map['lang_id'] = _lang_id;
    map['concept_id'] = _concept_id;

    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Objects.fromMap(Map<String, dynamic> map) {
    this.object = map['object'];
    this.lang_id = map['lang_id'];
    this.concept_id = map['concept_id'];
    this.id = map['id'];
  }
}
