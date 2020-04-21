import 'package:flutter/material.dart';
import './chat_model.dart';

class CourseConcepts extends StatefulWidget {
  final int id;
  CourseConcepts({Key key, @required this.id}) : super(key: key);
  @override
  _CourseConceptsState createState() => _CourseConceptsState(id);
}

class _CourseConceptsState extends State<CourseConcepts> {
  static int id;
  _CourseConceptsState(int id) {
    _CourseConceptsState.id = id;
  }
  List<ChatModel> g = ChatModel.data(id);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CourseConcepts'),
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
        child: ListView.builder(
          itemCount: g.length,
          itemBuilder: (context, index) {
            ChatModel _model = g[index];
            return Column(
              children: <Widget>[
                Divider(
                  height: 60.0,
                ),
                ListTile(
                  onTap: () => {debugPrint(_model.index.toString())},
                  leading: CircleAvatar(
                    radius: 29.0,
                    // backgroundImage: AssetImage(_model.avatarUrl),
                    child: new Text(_model.index.toString(),
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
                      Text(_model.name),
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
        ),
      ),
    );
  }
}
