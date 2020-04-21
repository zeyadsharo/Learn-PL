import 'package:flutter/material.dart';
import 'package:mobile_application/class/getdata.dart';
import 'package:mobile_application/class/savedata.dart';
import 'package:mobile_application/utils/database_helper.dart';
import 'model/courseconsepts.dart';
import 'model/lang.dart';
import 'ui/StartScreen.dart';

List myUsers;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = new DatabaseHelper();

  myUsers = await Getdata.getdata(0);
  for (int i = 0; i < myUsers.length; i++) {
    Lang user = Lang.map(myUsers[i]);
    print('ID: ${user.id} - lang: ${user.lang}');
  }
  // var foo = ["c#", "c++", "java"];
  // for (var i = 0; i < foo.length; i++) {
  //   var lang =await db.saveLang(new Lang(i,foo[i].toString()));
  // }
  //SaveData save = new SaveData();

  List myconcepts = await db.getAllconcepts(1);
  for (int i = 0; i < myconcepts.length; i++) {
    CourseConcepts concepts = CourseConcepts.map(myconcepts[i]);
    print('ID: ${concepts.concepts} - concepts: ${concepts.lang_id}');
  }

  Lang muhammed = await db.getLang(0);
  print('username : ${muhammed.lang}');
  print('Age : ${muhammed.id}');
  print('------------------------ ');
  print('------------------------ ');

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Final Project",
    home: new Home(),
  ));
}
