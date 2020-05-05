import 'package:flutter/material.dart';

import 'CourseConcepts.dart';
import 'Quiz/quizpage.dart';

class LearnScreen extends StatefulWidget {
  final String langname;
  LearnScreen({Key key, @required this.langname})
      : super(key: key);
  @override
  _LearnScreenState createState() => _LearnScreenState(langname);
}

class _LearnScreenState extends State<LearnScreen> {
  String langname;
  _LearnScreenState(String langname) {
    this.langname = langname;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn'),
        backgroundColor: Colors.red,
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
                  color: const Color(0xff0880f9).withOpacity(.6),
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
                    _sendDataToSecondScreen(context, langname);
                  },
                ),
                Spacer(flex: 4),
                RaisedButton(
                  color: const Color(0xff0880f9).withOpacity(.6),
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
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      // in changelog 1 we will pass the langname name to ther other widget class
                      // this name will be used to open a particular JSON file
                      // for a particular language
                      builder: (context) => Quizpage(langname),
                    ));
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

  void _sendDataToSecondScreen(BuildContext context, String langnamed) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseConcept(
            langname: langnamed,
          ),
        ));
  }
}
