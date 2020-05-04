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
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Final Project",
    home: new Home(),
  ));
}
