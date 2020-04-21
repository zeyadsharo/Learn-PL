import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/utils/database_helper.dart';

class Getdata {
  static Future<dynamic> getdata(int id) async {
    var db = new DatabaseHelper();
    List myUsers = await db.getAllconcepts(id);
    return myUsers;
  }
}
