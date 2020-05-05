import 'package:flutter/material.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/utils/database_helper.dart';

String _getdata2;

class DescreiptionPage extends StatelessWidget {
  final String description;
  final String object;
  DescreiptionPage({Key key, @required this.description,@required this.object}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    _getdata2 = "zeyad ";
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                ),

                Container(
                  color: Colors.blue, // Yellow
                  height: 60.0,
                  child: Center(
                    child: IconButton(
                      color: Colors.white,
                      icon: Icon(
                        Icons.close,
                        size: 45,
                        color: Colors.yellow,
                      ),
                      tooltip: 'close',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                ),
                Center(
                  child: Text(
                    object,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 10,
                    width: 200,
                    child: Divider(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.blue, // Yellow
                      width: 300,
                      child: Center(
                          child: FutureBuilder(
                        initialData: 'Get Data ...',
                        future: _getData(description),
                        builder: (context, snapshot) {
                          return Text(
                            description,
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.left,
                          );
                        },
                      )),
                    ),
                  ]),
                ),
                // Text('Some Sample dfdsfdsfText - 3',
                //     ),
              ],
            ),
          ),
        )));
  }

  Future<String> _getData(String conceptname) async {
    var db = new DatabaseHelper();
    Future<List<String>> _getData() async {
      var values = new List<String>();
    }

    try {
      var db = new DatabaseHelper();
      Objects concepts = await db.getobject(conceptname);
      return concepts.description;
    } catch (e) {
      return "error";
    }
  }

}
