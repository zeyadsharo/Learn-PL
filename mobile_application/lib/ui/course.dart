import 'package:flutter/material.dart';
import './chat_model.dart';

class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Chat'),
      ),
      body: Container(
        margin: new EdgeInsets.symmetric(horizontal: 20.0, vertical: 1.0),
        child: ListView.builder(
          itemCount: ChatModel.dummyData.length,
          itemBuilder: (context, index) {
            ChatModel _model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                Divider(
                  height: 60.0,
                ),
                ListTile(
                  onTap: () => {debugPrint("Asdasdsad")},
                  leading: CircleAvatar(
                    radius: 29.0,
                    backgroundImage: AssetImage(_model.avatarUrl),
                  ),
                  title: Row(
          
                    children: <Widget>[
                      Text(_model.name),
                      SizedBox(
                        width: 16.0,
                      ),
                    ],
                  ),
                  subtitle: Text(_model.message),
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
