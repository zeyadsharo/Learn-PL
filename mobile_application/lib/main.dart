import 'package:flutter/material.dart';
import 'ui/StartScreen.dart';

List myUsers;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Learn Programming Language",
    home: new Home(),
  ));
}
