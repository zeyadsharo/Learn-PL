import 'package:mobile_application/class/savedata.dart';
import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/description_objects.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class DatabaseHelper {
  static Database _db;
  //Langauge table
  final String langtable = 'langtable';
  final String columnId = 'id';
  final String columnlang = 'lang';
  final String columndes = 'description';
  //Course consepts table
  final String courseCT = 'course_concepts';
  final String conceptID = 'id';
  final String conceptName = 'concepts';
  final String langID = 'langid';
//Course Objects table
  final String objectsT = 'objects';
  final String objectID = 'id';
  final String objectName = 'object';
  final String conceptId = "conceptid";
//Course Description  table
  final String descriptiontable = 'descriptions';
  final String descriptionID = 'id';
  final String decriptionName = 'description';
  final String objectid = "objectid";

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await intDB();
    return _db;
  }

  intDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'mydb.db');
    var myOwnDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myOwnDB;
  }

  void _onCreate(Database db, int newVersion) async {
    var sql =
        "CREATE TABLE $langtable ($columnId INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $columnlang TEXT, $columndes TEXT)";
    await db.execute(sql);

    var sql1 =
        "CREATE TABLE $courseCT ($conceptID INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $conceptName TEXT,$langID INTEGER)";
    await db.execute(sql1);
    var sql2 =
        "CREATE TABLE $objectsT ($objectID INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $objectName TEXT,$conceptId INTEGER )";
    await db.execute(sql2);
    var sql3 =
        "CREATE TABLE $descriptiontable ($descriptionID INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $decriptionName TEXT,$objectid INTEGER )";
    await db.execute(sql3);
    SaveData save = new SaveData();
  }

//for course concepts table
  Future<int> savecourseconcepts(CourseConcepts courseConcepts) async {
    var dbClient = await db;
    int result = await dbClient.insert("$courseCT", courseConcepts.toMap());
    return result;
  }

//objects table
  Future<int> saveobjects(Objects objects) async {
    var dbClient = await db;
    int result = await dbClient.insert("$objectsT", objects.toMap());
    return result;
  }

  Future<Objects> getDescription(int lang_id, int concept_id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $objectsT WHERE $conceptId = $concept_id";
    List result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    return new Objects.fromMap(result.first);
  }

  Future<List> getAllconcepts(int id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $courseCT WHERE $langID = $id";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<List> getAllobjects(int id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $objectsT WHERE $conceptId =?";
    List result = await dbClient.rawQuery(sql,[id]);
    return result.toList();
  }

//description _objects table
  Future<int> save_description(DescriptionObjects descriptionObjects) async {
    var dbClient = await db;
    int result =
        await dbClient.insert("$descriptiontable", descriptionObjects.toMap());
    return result;
  }

  Future<List> getAlldescription() async {
    var dbClient = await db;
    var sql = "SELECT * FROM $descriptiontable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> saveLang(Lang lang) async {
    var dbClient = await db;
    int result = await dbClient.insert("$langtable", lang.toMap());
    return result;
  }

  Future<List> getAllLang() async {
    var dbClient = await db;
    var sql = "SELECT * FROM $langtable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<CourseConcepts> getconcepts(String name) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $courseCT WHERE $conceptName=?";
    var result = await dbClient.rawQuery(sql, [name]);
    if (result.length == 0) return null;
    return new CourseConcepts.fromMap(result.first);
  }

  Future<Lang> getLang(String name) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $langtable WHERE $columnlang=?";
    var result = await dbClient.rawQuery(sql, [name]);
    if (result.length == 0) return null;
    return new Lang.fromMap(result.first);
  }

  Future<int> getCount() async {
    var dbClient = await db;
    var sql = "SELECT COUNT(*) FROM $langtable";

    return Sqflite.firstIntValue(await dbClient.rawQuery(sql));
  }

  Future<void> close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
