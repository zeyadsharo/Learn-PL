class Lang {
  int id;
  String lang;

  Lang(this.lang);
  Lang.map(dynamic obj) {
    this.lang = obj['lang'];
    // this.id = obj['id'];
  }
  String get _lang => lang;
  int get _id => id;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['lang'] = _lang;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Lang.fromMap(Map<String, dynamic> map) {
    this.lang = map['lang'];
    this.id = map['id'];
  }
}
