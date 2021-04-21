import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'capp_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Build());
} 

class Build extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // TO DO
          //return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return CappApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // TO DO
        //return Loading();
        return CappApp(); // for now
      },
    );
  }
}