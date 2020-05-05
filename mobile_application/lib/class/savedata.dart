import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/utils/database_helper.dart';

class SaveData {
  int conceptid = 0;
  int basicconceptsid = 0;
  SaveData() {
    savelang();
    saveconceptjava();
    // saveconcepts();
    // saveobjects();
    print("database saved");
  }
  var db = new DatabaseHelper();
  Future<void> savelang() async {
    var language = ["Python", "Java", "C#", "C++"];
    var des = [
      "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learn it.. \nJust test yourself !!",
      "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
      "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
      "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
      "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
    ];
    for (var i = 0; i < language.length; i++) {
      await db.saveLang(new Lang(i, language[i].toString(), des[i].toString()));
    }
    print("lang saved");
  }

  Future<void> saveconceptjava() async {
    var javaconcepts = [
      "Basic concepts",
      "conditional and loops",
      "Array",
      "Classes and Object",
      "more On classes"
    ];

    var basicconcepts = [
      "Introduction to Java",
      "A Hello World Program",
      "Java comments",
      "Variables",
      "Primitive Operotor",
      "Strings",
      "Getting User Input",
      "Conditinal Statment",
      "Else if Statment",
      "Logical Statment"
    ];
    var conditionandloop = [
      "Conditional Statements",
      "Nested if Statements",
      "else if Statements",
      "Logical Operators",
      "The switch Statement",
      "while Loops",
      "for Loops"
    ];
    for (var i = conceptid; i < javaconcepts.length; i++) {
      await db.savecourseconcepts(
          new CourseConcepts(conceptid++, javaconcepts[i].toString(), 1));
    }
    for (var i = 0; i < basicconcepts.length; i++) {
      await db.saveobjects(new Objects(basicconcepts[i].toString(),
          "description for " + basicconcepts[i].toString(), 0));
    }

    for (var i = 0; i < conditionandloop.length; i++) {
      await db.saveobjects(new Objects(conditionandloop[i].toString(),
          "description for " + basicconcepts[i].toString(), 1));
    }
  }
}
