import "package:flutter/material.dart";
import 'coursescreen/Course.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scaffold(
        body: new Container(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Spacer(flex: 7),
                new Container(
                    width: 190.0,
                    height: 190.0,
                    decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new ExactAssetImage('images/la.png'),
                        ))),
                Spacer(flex: 2),
                new Text(
                  "Way To Learn \nProgramming Languages",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Yu Gothic UI",
                    fontSize: 30,
                    color: Color(0xffed3636),
                  ),
                ),
                //button

                Spacer(
                  flex: 7,
                ),
                RaisedButton(
                  color: const Color(0xff1111ed),
                  child: new Text(
                    "Get started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Microsoft JhengHei UI",
                      fontSize: 20,
                      color: Color(0xffffffff),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>CourseScreen()),
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
