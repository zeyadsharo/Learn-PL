import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/utils/database_helper.dart';

class SaveData {
  SaveData() {
    savelang();
    saveconcepts();
    print("database saved");
  }
  var db = new DatabaseHelper();
  Future<void> savelang() async {
    var language = ["Java", "C#", "Python", "C++"];
    for (var i = 0; i < language.length; i++) {
      await db.saveLang(new Lang(i, language[i].toString()));
    }
    print("lang saved");
  }

  Future<void> saveconcepts() async {
    var java = ["Basic consepts", "conditional and loop"];
    for (var i = 0; i < java.length; i++) {
      await db.save_course_concepts(new CourseConcepts(java[i].toString(), 0));
    }
    var python = ["Hello", "conditional and loop"];
    for (var i = 0; i < python.length; i++) {
      await db
          .save_course_concepts(new CourseConcepts(python[i].toString(), 1));
    }
    print("concepts saved");
  }
}
