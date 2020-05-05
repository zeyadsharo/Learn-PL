class Objects {
  int id;
  String object;
  int conceptid;

  Objects( this.object, this.conceptid);
  Objects.map(dynamic obj) {
    // this.id = obj['id'];
    this.object = obj['object'];
    this.conceptid = obj['conceptid'];
  }
  String get _object => object;
  int get _id => id;
  int get _conceptid => conceptid;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['object'] = _object;
    map['conceptid'] = _conceptid;

    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Objects.fromMap(Map<String, dynamic> map) {
    this.object = map['object'];
    this.conceptid = map['conceptid'];
    this.id = map['id'];
  }
}
