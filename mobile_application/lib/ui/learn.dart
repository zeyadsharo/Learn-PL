import 'package:flutter/material.dart';

import 'CourseConcepts.dart';

class LearnScreen extends StatefulWidget {
  final int id;
  LearnScreen({Key key, @required this.id}) : super(key: key);
  @override
  _LearnScreenState createState() => _LearnScreenState(id);
}

class _LearnScreenState extends State<LearnScreen> {
  int id;
  _LearnScreenState(int  id) {
    this.id = id;
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
                    _sendDataToSecondScreen(context, this.id);
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
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => CourseConcepts()),
                    // );
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

  void _sendDataToSecondScreen(BuildContext context, int idd) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseConcepts(
            id: idd,
          ),
        ));
  }
}
