import 'package:flutter/material.dart';
import 'package:mobile_application/model/lang.dart';
import 'package:mobile_application/utils/database_helper.dart';
import '../learn.dart';
import 'package:flutter/services.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  List<String> images = [
    "images/py.png",
    "images/java.png",
    "images/cshap.png",
    "images/cpp.png",
  ];
  Widget customcard(String langname, String image, String des, int id) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          _sendDataToSecondScreen(context, langname);
        },
        child: Material(
            color: Colors.indigoAccent,
            elevation: 10.0,
            borderRadius: BorderRadius.circular(25.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Course",
            style: TextStyle(
              fontFamily: "Quando",
            ),
          ),
        ),
        body: FutureBuilder(
            future: _getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          Lang lang = Lang.map(snapshot.data[index]);
                          return customcard(lang.lang, images[index],
                              lang.description, lang.id);
                        }));
              }
            }));
  }
}

Future<List<Map<String, dynamic>>> _getData() async {
  var db = new DatabaseHelper();
  List language = await db.getAllLang();
  return language;
}

void _sendDataToSecondScreen(BuildContext context, String langnamed) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LearnScreen(
          langname: langnamed,
        ),
      ));
}
