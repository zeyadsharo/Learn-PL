class CourseConcepts {
  int id;
  String concepts;
  int langid;
  CourseConcepts(this.id, this.concepts, this.langid);
  CourseConcepts.map(dynamic obj) {
    this.id = obj['id'];
    this.concepts = obj['concepts'];
    this.langid = obj['langid'];
  }
  String get _concepts => concepts;
  int get _id => id;
  int get _langid => langid;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['concepts'] = _concepts;
    map['langid'] = _langid;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  CourseConcepts.fromMap(Map<String, dynamic> map) {
    this.concepts = map['concepts'];
    this.langid = map['langid'];
    this.id = map['id'];
  }
}
