// Home Page Tab: includes hours, menu
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'loading.dart';
import 'menu_tab.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("Cap Bar Hours")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final docData = snapshot.data!.docs[index].data();
                  return ListTile(
                    title: Text(docData.toString()),
                  
                  );
                },
              );
            } else {
              return Loading();
            }
          },
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
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
