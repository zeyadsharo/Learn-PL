import 'package:flutter/cupertino.dart';
import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/utils/database_helper.dart';

class ChatModel {
  String avatarUrl;
  String name;
  String datetime;
  String message;
  int index;

  static List myUsers;
  ChatModel(
      {this.avatarUrl, this.name, this.datetime, this.message, this.index});
  static List<ChatModel> bigdata = [];
  static Future<List> ss(int id) async {
    var db = new DatabaseHelper();
    myUsers = await db.getAllconcepts(id);
    bigdata.clear();
    for (var i = 0; i < myUsers.length; i++) {
      CourseConcepts user = CourseConcepts.map(myUsers[i]);
      bigdata.add(ChatModel(
        avatarUrl: "images/flower.jpg",
        name: "${user.concepts}",
        datetime: "20:18",
        index: i,
      ));
    }
  }

  static List<ChatModel> data(int id) {
    //  bigdata.clear();
    //sleep(Duration(seconds: 2));
    ss(id);
    return bigdata;
  }
}
