

class Objects {
  int id;
  String object;
  Objects(this.object);
  Objects.map(dynamic obj) {
    this.object = obj['object'];
  }
  String get _object => object;
  int get _id => id;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['object'] = _object;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Objects.fromMap(Map<String, dynamic> map) {
    this.object = map['object'];
    this.id = map['id'];
  }
}
