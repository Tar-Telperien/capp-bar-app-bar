import 'package:flutter/material.dart';

/// Splashscreen widget
/// Used in main.dart for building a MaterialApp
/// splashscreen when the app is initially loading.
class Loading extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color(0xFFFFFFFF)
          ),
        Image.asset(
          "assets/images/loading.png",
          )
      ],
    );
  }
}