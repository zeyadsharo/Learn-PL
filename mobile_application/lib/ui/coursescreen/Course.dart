import 'package:flutter/material.dart';
import '../learn.dart';
import 'cardWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
      
    home: new Course(),
  ));
}

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var array = ["Java", "C#", "Python", "C++"];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
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
                    _sendDataToSecondScreen(context,0);
                  },
                  child: CardWidget(
                    color: Color(0xff0880f9).withOpacity(.6),
                    profileImage: 'images/java.png',
                    name: array[0],
                    //job: 'Minions',
                    
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _sendDataToSecondScreen(context, 1);
                  },
                  child: CardWidget(
                    color:Color(0xff0880f9).withOpacity(.6),
                    profileImage: 'images/csharp.png',
                    name: array[1],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _sendDataToSecondScreen(context, 2);
                  },
                  child: CardWidget(
                    color:Color(0xff0880f9).withOpacity(.6),
                    profileImage: 'images/flower.jpg',
                    name: array[2],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _sendDataToSecondScreen(context, 3);
                  },
                  child: CardWidget(
                    color:Color(0xff0880f9).withOpacity(.6),
                    profileImage: 'images/c.png',
                    name: array[3],
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

  void _sendDataToSecondScreen(BuildContext context, int idd) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LearnScreen(
            id: idd,
          ),
        ));
  }
}
