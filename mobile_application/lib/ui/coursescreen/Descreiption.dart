import 'package:flutter/material.dart';
import 'package:mobile_application/model/objects.dart';
import 'package:mobile_application/utils/database_helper.dart';

String _getdata2;

class AboutPage extends StatelessWidget {
  final String text;
  final int lang_id;
  final int consept_id;
  AboutPage(
      {Key key,
      @required this.text,
      @required this.lang_id,
      @required this.consept_id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    _getdata2 = "zeyad ";

    // _getdata2 = _getdata(0, 1).then((value) => value).toString();
    //print(b);
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
                    this.text,
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

                // Text('Some Sample Text - 2', style: TextStyle(fontSize: 28)),
                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      color: Colors.blue, // Yellow
                      width: 300,
                      child: Center(
                          child: FutureBuilder(
                        initialData: 'Get Data ...',
                        future: _getData(lang_id, consept_id),
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data.toString(),
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.left,
                          );
                        },
                      )),
                    ),
                  ]),
                ),

                Container(
                  color: Colors.blue, // Yellow
                  height: 60.0,
                  child: Center(
                    child: RaisedButton(
                      color: const Color(0xff1111ed),
                      child: new Text(
                        "Next",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Microsoft JhengHei UI",
                          fontSize: 20,
                          color: Color(0xffffffff),
                        ),
                      ),
                      onPressed: () {
                        _sendDataToSecondScreen(
                            context, "Hello world", lang_id, consept_id);
                      },
                    ),
                  ),
                ),
                // Text('Some Sample dfdsfdsfText - 3',
                //     ),
              ],
            ),
          ),
        )));
  }

  Future<String> _getData(int langId, int conceptId) async {
    var db = new DatabaseHelper();
    //print(_getdata2);
    try { 
      Objects object = await db.getObjects(langId, conceptId);
      return object.object;
    } catch (e) {
      return "error";
    }
  }

  void _sendDataToSecondScreen(
      BuildContext context, String text, int lan_id, int con_id) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AboutPage(
            text: text,
            lang_id: lan_id,
            consept_id: con_id,
          ),
        ));
  }
}
