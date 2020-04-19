import 'package:flutter/material.dart';
import 'course.dart';

class LearnScreen extends StatefulWidget {
  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('learn'),
      ),
      body: new Scaffold(
        body: new Container(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(
                  flex: 7,
                ),
                RaisedButton(
                  color: const Color(0xff1111ed),
                  child: new Text(
                    "Course",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Microsoft JhengHei UI",
                      fontSize: 26,
                      color: Color(0xffffffff),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseScreen()),
                    );
                  },
                ),
                Spacer(flex: 4),
                RaisedButton(
                  color: const Color(0xff1111ed),
                  child: new Text(
                    "Quiz",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Microsoft JhengHei UI",
                      fontSize: 26,
                      color: Color(0xffffffff),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CourseScreen()),
                    );
                  },
                ),
                Spacer(
                  flex: 7,
                ),
              ]),
          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
