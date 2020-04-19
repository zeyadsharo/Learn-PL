import 'package:flutter/material.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/utils/database_helper.dart';
import '../learn.dart';
import 'cardWidget.dart';
List myLang;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = new DatabaseHelper();
  await db.saveLang(new Lang("C#"));
  //TODO:read data from database
  myLang = await db.getAllLang();
  for (int i = 0; i < myLang.length; i++) {
    Lang lang = Lang.map(myLang[i]);
    print(
        'ID: ${lang.id} - lang: ${lang.lang}');
  }
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Course(),
  ));
}

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xff1313ee).withOpacity(0.77),
          title: new Center(
              child: new Text("Course", textAlign: TextAlign.center)),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 5),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LearnScreen()),
                    );
                  },
                  child: CardWidget(
                    color: Color(0xffffeb80).withOpacity(0.43),
                    profileImage: 'images/java.png',
                    name: "Java",
                    job: 'Minions',
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: CardWidget(
                    color: Color(0xffd5f6e2).withOpacity(0.43),
                    profileImage: 'images/csharp.png',
                    name: 'C#',
                    job: 'Toy Story',
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: CardWidget(
                    color: Color(0xffff9bc6).withOpacity(0.43),
                    profileImage: 'images/flower.jpg',
                    name: 'Python',
                    job: 'Toy Story',
                  ),
                ),
                GestureDetector(
                  onTap: null,
                  child: CardWidget(
                    color: Color(0xffd5c4f5).withOpacity(0.43),
                    profileImage: 'images/c.png',
                    name: 'C++',
                    job: 'Toy Story',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
