class Lang {
  int id;
  String lang;
  String description;

  Lang(this.id, this.lang, this.description);
  Lang.map(dynamic obj) {
    this.lang = obj['lang'];
    this.id = obj['id'];
    this.description = obj['description'];
  }
  String get _lang => lang;
  int get _id => id;
  String get _description => description;
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['lang'] = _lang;
    map['description'] = _description;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Lang.fromMap(Map<String, dynamic> map) {
    this.lang = map['lang'];
    this.id = map['id'];
    this.description = map['description'];
  }
}
