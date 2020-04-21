import 'package:mobile_application/class/savedata.dart';
import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/description_objects.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/model/user.dart';
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
  //Course consepts table
  final String course_concepts_table = 'course_concepts';
  final String concepts_id = 'id';
  final String concepts_name = 'concepts';
  final String concepts_lang_id = 'lang_id';
//Course Objects table
  final String objects_table = 'objects';
  final String objects_id = 'id';
  final String objects_name = 'object';
  final String objects_lang_id = "lang_id";
  final String objects_concepts_id = "concept_id";
//Course Description  table
  final String description_table = 'descriptions';
  final String description_id = 'id';
  final String description_name = 'description';

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
        " $columnlang TEXT)";
    await db.execute(sql);

    var sql1 =
        "CREATE TABLE $course_concepts_table ($concepts_id INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $concepts_name TEXT,$concepts_lang_id INTEGER)";
    await db.execute(sql1);
    var sql2 =
        "CREATE TABLE $objects_table ($objects_id INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $objects_name TEXT,$objects_lang_id INTEGER,$objects_concepts_id INTEGER )";
    await db.execute(sql2);
    var sql3 =
        "CREATE TABLE $description_table ($description_id INTEGER PRIMARY KEY AUTOINCREMENT,"
        " $description_name TEXT)";
    await db.execute(sql3);
    SaveData save = new SaveData();
  }

//for course concepts table
  Future<int> save_course_concepts(CourseConcepts courseConcepts) async {
    var dbClient = await db;
    int result =
        await dbClient.insert("$course_concepts_table", courseConcepts.toMap());
    return result;
  }

  Future<List> getAllconcepts(int id) async {
    var dbClient = await db;
    var sql =
        "SELECT * FROM $course_concepts_table WHERE $concepts_lang_id = $id";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

//objects table
  Future<int> save_objects(Objects objects) async {
    var dbClient = await db;
    int result = await dbClient.insert("$objects_table", objects.toMap());
    return result;
  }

    Future<Objects> getObjects(int lang_id,int concept_id) async {
     var dbClient = await db;
    var sql = "SELECT * FROM $objects_table WHERE $objects_lang_id = $lang_id AND $objects_concepts_id =$concept_id";
    List result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    return new Objects.fromMap(result.first);
  }

  Future<List> getAllobjects( int lang_id,int concept_id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $objects_table WHERE $objects_lang_id = $lang_id AND $objects_concepts_id =$concept_id";
    List result = await dbClient.rawQuery(sql);
    return result;
  }
//description _objects table
    Future<int> save_description(DescriptionObjects descriptionObjects) async {
      var dbClient = await db;
      int result = await dbClient.insert(
          "$description_table", descriptionObjects.toMap());
      return result;
    }

    Future<List> getAlldescription() async {
      var dbClient = await db;
      var sql = "SELECT * FROM $description_table";
      List result = await dbClient.rawQuery(sql);
      return result.toList();
    }
  

  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int result = await dbClient.insert("$langtable", user.toMap());
    return result;
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

  Future<Lang> getLang(int id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $langtable WHERE $columnId = $id";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    return new Lang.fromMap(result.first);
  }

  Future<int> getCount() async {
    var dbClient = await db;
    var sql = "SELECT COUNT(*) FROM $langtable";

    return Sqflite.firstIntValue(await dbClient.rawQuery(sql));
  }

  Future<User> getUser(int id) async {
    var dbClient = await db;
    var sql = "SELECT * FROM $langtable WHERE $columnId = $id";
    var result = await dbClient.rawQuery(sql);
    if (result.length == 0) return null;
    return new User.fromMap(result.first);
  }

  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(langtable, where: "$columnId = ?", whereArgs: [id]);
  }

  Future<int> updateUser(User user) async {
    var dbClient = await db;
    return await dbClient.update(langtable, user.toMap(),
        where: "$columnId = ?", whereArgs: [user.id]);
  }

  Future<void> close() async {
    var dbClient = await db;
    return await dbClient.close();
  }
}
