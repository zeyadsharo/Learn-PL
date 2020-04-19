import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.close),
              tooltip: 'close',
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.indigo,
                backgroundImage: AssetImage('images/flower.jpg'),
              ),
            ),
            Text(
              "Kevin",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 33,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Minions",
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 40,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting,remaining essentially unchanged. It was popularised in the 1960s with the release  ",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  height: 1.3,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: FlatButton(
                onPressed: null,
                child: Text(
                  'Contact',
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
