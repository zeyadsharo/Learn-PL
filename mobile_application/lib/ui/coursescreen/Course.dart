import 'package:flutter/material.dart';
import 'package:mobile_application/model/courseconsepts.dart';
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
    "images/js.png",
    "images/cpp.png",
    "images/linux.png",
  ];
  List<String> lang = ["SDF", "sfdsf", "sdfsdf", "sdfsdf"];
  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learn it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
  ];

  Widget customcard(String langname, String image, String des) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushReplacement(MaterialPageRoute(
          //   // in changelog 1 we will pass the langname name to ther other widget class
          //   // this name will be used to open a particular JSON file
          //   // for a particular language
          //   builder: (context) => getjson(langname),
          // ));
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
                        itemCount: lang.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          Lang lang = Lang.map(snapshot.data[index]);
                          return customcard(
                              lang.lang, images[index], lang.description);
                        }));
              }
            }));
  }
}

Future<List<Map<String, dynamic>>> _getData() async {
  var values = new List<String>();

  //throw new Exception("Danger Will Robinson!!!");
  var db = new DatabaseHelper();
  List myUsers = await db.getAllLang();
  return myUsers;
  // // await new Future.delayed(new Duration(seconds: 2));
  // for (var i = 0; i < myUsers.length; i++) {
  //   Lang lang = Lang.map(myUsers[i]);
  //   values.addAll(["${lang.lang}"]);
  // }
  // return values;
}

void _sendDataToSecondScreen(BuildContext context, String lang) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LearnScreen(
          langname: lang,
        ),
      ));
}
