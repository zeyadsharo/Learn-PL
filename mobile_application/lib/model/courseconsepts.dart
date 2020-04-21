class CourseConcepts {
  int id;
  String concepts;
  int lang_id;
  CourseConcepts(this.concepts, this.lang_id);
  CourseConcepts.map(dynamic obj) {
    this.concepts = obj['concepts'];
    this.lang_id = obj['lang_id'];
  }
  String get _concepts => concepts;
  int get _id => id;
  int get _lang_id => lang_id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['concepts'] = _concepts;
    map['lang_id'] = _lang_id;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  CourseConcepts.fromMap(Map<String, dynamic> map) {
    this.concepts = map['concepts'];
    this.lang_id = map['lang_id'];
    this.id = map['id'];
  }
}
