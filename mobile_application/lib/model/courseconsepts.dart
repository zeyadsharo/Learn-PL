class CourseConcepts {
  int id;
  String concepts;
  CourseConcepts(this.concepts);
  CourseConcepts.map(dynamic obj) {
    this.concepts = obj['concepts'];
  }
  String get _concepts => concepts;
  int get _id => id;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['concepts'] = _concepts;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }
  CourseConcepts.fromMap(Map<String, dynamic> map) {
    this.concepts = map['concepts'];
    this.id = map['id'];
  }
}
