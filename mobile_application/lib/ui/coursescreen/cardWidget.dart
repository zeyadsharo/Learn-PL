import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({this.profileImage, this.name, this.job, this.color});
  final profileImage;
  final name;
  final job;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: color,
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                //backgroundColor: Colors.indigo,
                backgroundImage: AssetImage(profileImage),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 23,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
              Container(
                child:  Icon(
                    Icons.check_circle_outline,
                    size: 30.0,
                    color: Colors.green,
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
