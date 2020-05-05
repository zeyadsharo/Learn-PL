import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_application/model/courseconsepts.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/ui/coursescreen/Descreiption.dart';
import 'package:mobile_application/utils/database_helper.dart';

int count = 0;

class Object extends StatefulWidget {
  final String conceptsname;
  Object({Key key, @required this.conceptsname}) : super(key: key);
  @override
  @override
  _Myobjectpage createState() => _Myobjectpage(conceptsname);
}

class _Myobjectpage extends State<Object> {
  String conceptsname;
  _Myobjectpage(String conceptsnames) {
    this.conceptsname = conceptsnames;
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
        title: Text('Objects'),
        backgroundColor: Colors.red,
      ),
      body: futureBuilder,
    );
  }

  Future<List<Map<String, dynamic>>> _getData() async {
    var db = new DatabaseHelper();
    CourseConcepts concepts = await db.getconcepts(conceptsname);
    int id = concepts.id;
    if (id != null) count = await db.getCountobject(id);
    print(" consepts id $id");
    List object = await db.getAllobjects(id);
    return object;
  }

  Widget createListView(BuildContext context, AsyncSnapshot snapshot) {
    return new ListView.builder(
      itemCount: count ,
      itemBuilder: (BuildContext context, int index) {
        Objects object = Objects.map(snapshot.data[index]);
        return new Column(
          children: <Widget>[
            Divider(
              height: 20.0,
            ),
            ListTile(
              onTap: () =>
                  {_sendDataToSecondScreen(context,object.object.toString(),object.description.toString())},
              leading: CircleAvatar(
                radius: 29.0,
                backgroundColor: Color(0xff26a019),
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
                  Text(object.object.toString()),
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
            ),
          ],
        );
      },
    );
  }

  void _sendDataToSecondScreen(BuildContext context, String object,String description) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DescreiptionPage(
            description: description,
            object:object,
          ),
        ));
  }
}
