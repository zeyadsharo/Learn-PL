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

  Future<void> saveconcepts() async {
    var java = [
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
    for (var i = 0; i < java.length; i++) {
      await db.save_course_concepts(new CourseConcepts(java[i].toString(), 0));
    }
    var csharp = ["Hello Javascript", "conditional and loop"];
    for (var i = 0; i < csharp.length; i++) {
      await db
          .save_course_concepts(new CourseConcepts(csharp[i].toString(), 1));
    }
    var python = ["Hello Python", "conditional and loop"];
    for (var i = 0; i < python.length; i++) {
      await db
          .save_course_concepts(new CourseConcepts(python[i].toString(), 2));
    }
    var cplas = ["Hello C++", "conditional and loop"];
    for (var i = 0; i < cplas.length; i++) {
      await db.save_course_concepts(new CourseConcepts(cplas[i].toString(), 3));
    }
    var linux = ["Hello Linux", "conditional and loop"];
    for (var i = 0; i < linux.length; i++) {
      await db.save_course_concepts(new CourseConcepts(linux[i].toString(), 4));
    }
    print("concepts saved");
  }

  Future<void> saveobjects() async {
    var javaconcepts = [
      """ Java is a popular programming language, created in 1995
          It is owned by Oracle, and more than 3 billion devices run Java
          It is used for:
          Mobile applications (specially Android apps)
          Desktop applications
          Web applications
          Web servers and application servers
          Games
          Database connection
          And much, much more!
          Why Use Java?
          Java works on different platforms (Windows, Mac, Linux, Raspberry Pi, etc.)
          It is one of the most popular programming language in the world
          It is easy to learn and simple to use
          It is open-source and free
          It is secure, fast and powerful
          It has a huge community support (tens of millions of developers)
          Java is an object oriented language which gives a clear structure to programs and allows code to be reused, lowering development costs
          As Java is close to C++ and C#, it makes it easy for programmers to switch to Java or vice versa""",
      """Java is an object oriented language (OOP). Java objects are part of so-called "Java classes".
          Let's go over the Hello world program, which simply prints "Hello, World!" to the screen.
           public class Main {
            public static void main(String[] args) {
            System.out.println("This will be printed");
           }
          }""",
      """Java CommentsThe Java comments are the statements that are not executed by the compiler and interpreter. The comments can be used to provide information or explanation about the variable, method, class or any statement. It can also be used to hide program code.
         Types of Java Comments
         There are three types of comments in Kava.
         single Line Comment
         Multi Line Comment
         Documentation Comment"""
    ];
    for (var i = 0; i < javaconcepts.length; i++) {
      await db.save_objects(new Objects(javaconcepts[i].toString(), 0, i));
    }

    var python = [
      """ Java is a popular programming language, created in 1995
          It is owned by Oracle, and more than 3 billion devices run Java
          It is used for:
          Mobile applications (specially Android apps)
          Desktop applications
          Web applications
          Web servers and application servers
          Games
          Database connection
          And much, much more!
          Why Use Java?
          Java works on different platforms (Windows, Mac, Linux, Raspberry Pi, etc.)
          It is one of the most popular programming language in the world
          It is easy to learn and simple to use
          It is open-source and free
          It is secure, fast and powerful
          It has a huge community support (tens of millions of developers)
          Java is an object oriented language which gives a clear structure to programs and allows code to be reused, lowering development costs
          As Java is close to C++ and C#, it makes it easy for programmers to switch to Java or vice versa""",
      """Java is an object oriented language (OOP). Java objects are part of so-called "Java classes".
          Let's go over the Hello world program, which simply prints "Hello, World!" to the screen.
           public class Main {
            public static void main(String[] args) {
            System.out.println("This will be printed");
           }
          }""",
      """Java CommentsThe Java comments are the statements that are not executed by the compiler and interpreter. The comments can be used to provide information or explanation about the variable, method, class or any statement. It can also be used to hide program code.
         Types of Java Comments
         There are three types of comments in Kava.
         single Line Comment
         Multi Line Comment
         Documentation Comment"""
    ];
    for (var i = 0; i < python.length; i++) {
      await db.save_objects(new Objects(python[i].toString(), 2, i));
    }
  }
}
