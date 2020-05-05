import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/utils/database_helper.dart';
import 'objects.dart';

class CourseConcept extends StatelessWidget {
  final String langname;
  CourseConcept({Key key, @required this.langname}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(langname),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String langname;
  MyHomePage(String langname) {
    this.langname = langname;
  }

  @override
  _MyHomePageState createState() => new _MyHomePageState(this.langname);
}

class _MyHomePageState extends State<MyHomePage> {
  String langname;
  _MyHomePageState(String langname) {
    this.langname = langname;
  }

  @override
  Widget build(BuildContext context) {
    var futureBuilder = new FutureBuilder(
      future: _getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return new Text('loading...');
          default:
            if (snapshot.hasError)
              return new Text('Error: ${snapshot.error}');
            else
              return createListView(context, snapshot);
        }
      },
    );

    return new Scaffold(
      appBar: AppBar(
        title: Text('CourseConcept'),
        backgroundColor: Colors.red,
      ),
      body: futureBuilder,
    );
  }

  Future<List<String>> _getData() async {
    var values = new List<String>();
    values.clear();
    //throw new Exception("Danger Will Robinson!!!");

    var db = new DatabaseHelper();

    Lang lang = await db.getLang(langname);
    int id = lang.id;
    print("java id $id");
    List myUsers = await db.getAllconcepts(id);
    // await new Future.delayed(new Duration(seconds: 2));
    for (var i = 0; i < myUsers.length; i++) {
      CourseConcepts concepts = CourseConcepts.map(myUsers[i]);
      values.add(
        "${concepts.concepts}",
      );
    }
    return values;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    List<String> values = snapshot.data;
    return new ListView.builder(
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        return new Column(
          children: <Widget>[
            Divider(
              height: 20.0,
            ),
            ListTile(
                
              onTap: () => { _sendDataToSecondScreen(context,values[index].toString())},
              leading: CircleAvatar(
                radius: 29.0,
                // backgroundImage: AssetImage(_model.avatarUrl),
                child: new Text((index + 1).toString(),
                    style: TextStyle(
                      fontFamily: "Microsoft JhengHei UI",
                      fontSize: 28,
                      color: Color(0xffffffff),
                    )),
              ),
              title: Wrap(
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                direction: Axis.horizontal,
                children: <Widget>[
                  Text(values[index]),
                  SizedBox(
                    width: 16.0,
                  ),
                ],
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
                color: Colors.red,
              ),
              // new Divider(
              //   height: 2.0,
              // ),
            ),
          ],
        );
      },
    );
  }

  void _sendDataToSecondScreen(BuildContext context, String conceptsnamed) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Object(
            conceptsname: conceptsnamed,
          ),
        ));
  }
}
