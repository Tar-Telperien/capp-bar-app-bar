// Capp Bar Menu
// Will hold menu items and button to add menu item to cart/orders
import 'package:capp_app/capp_app.dart';
import 'package:capp_app/screens/orders_tab.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Menu Items").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
      floatingActionButton:
      FloatingActionButton.extended(
        onPressed:(){
        // Program it to navigate to the cart screen
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Orders()),
            );
        },
        label: const Text('Orders'),
        icon: const Icon(Icons.shopping_cart),
        backgroundColor: sageGreen,
      ),
    );
  }
}
