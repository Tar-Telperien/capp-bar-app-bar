// Home Page Tab: includes hours, menu
import 'package:flutter/material.dart';
import 'menu_tab.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        body: const CardWidget(),
      ),
    );
  }
}

class CardWidget extends StatelessWidget{
  @override
  const CardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Menu()),
            );
          },
          child: const SizedBox(
            width: 300,
            height: 100,
            child: Text('Cap Bar Menu'),
          ),
        ),
      ),
    );
  }
}