import 'package:flutter/material.dart';
import 'package:mobile_application/class/getdata.dart';
import 'package:mobile_application/class/savedata.dart';
import 'package:mobile_application/utils/database_helper.dart';
import 'model/courseconsepts.dart';
import 'model/lang.dart';
import 'model/objects.dart';
import 'ui/StartScreen.dart';

List myUsers;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SaveData save = new SaveData();
  var db = new DatabaseHelper();
  // myUsers = await Getdata.getdata(1);
  // for (int i = 0; i < myUsers.length; i++) {
  //   Lang user = Lang.map(myUsers[i]);
  //   print('ID: ${user.id} - lang: ${user.lang}');
  // }
  // var foo = ["c#", "c++", "java"];
  // for (var i = 0; i < foo.length; i++) {
  //   var lang =await db.saveLang(new Lang(i,foo[i].toString()));
  // }

  List myconcepts = await db.getAllobjects(0, 2);
  for (int i = 0; i < myconcepts.length; i++) {
    Objects concepts = Objects.map(myconcepts[i]);
    print(
        'ID: ${concepts.id} -lang_id : ${concepts.lang_id}  -conscptes_id : ${concepts.concept_id} -'
        'Objects : ${concepts.object} ');
  }

  // Lang muhammed = await db.getLang(0);
  // print('username : ${muhammed.lang}');
  // print('Age : ${muhammed.id}');
  // print('------------------------ ');
  // print('------------------------ ');

  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Final Project",
    home: new Home(),
  ));
}
