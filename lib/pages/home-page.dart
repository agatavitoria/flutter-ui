import 'package:flutter/material.dart';
import 'package:flutter_ui/widgets/circle_container.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Bem Vindo'),
              Text(
                "Darwin Santiago Morocho Rocha",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 1,
                width: 100,
                margin: EdgeInsets.symmetric(vertical: 20),
                color: Color(0xffaaaaaa),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleContainer(child: Icon(Icons.add), height: 55, width: 55),
                  SizedBox(width: 20),
                  CircleContainer(child: Icon(Icons.edit), height: 55, width: 55),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}