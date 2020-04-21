import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/utils/database_helper.dart';

class SaveData {
  SaveData() {
    savelang();
    saveconcepts();
    saveobjects();
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

  Future<void> saveobjects() async {
    var javaconcepts = [
      "Hello, World Java is an object oriented language (OOP). Java objects are part of so-called",
      "again means that anyone can access it.",
      " means that you can run this method without creating an instance of Main."
    ];
    for (var i = 0; i < javaconcepts.length; i++) {
      await db.save_objects(new Objects(javaconcepts[i].toString(), 0, i));
    }
  }
}
