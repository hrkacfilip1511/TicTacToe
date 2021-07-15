import 'package:flutter/material.dart';
import 'home.dart';
class BeforeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTacToe'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Card(

          child: Center(
            child: FlatButton.icon(
              color: Colors.amber,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Home(),
                ));
              },
              icon: Icon(
                Icons.play_arrow,
              ),
              label: Text('Započni igru'),
            ),
          ),
        ),
      ),
    );
  }
}
