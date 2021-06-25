import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:payflow/app_widget.dart';

void main() {
  runApp(AppWidget());
}

class AppFireBase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFireBase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Material(
            child: Text(
              "Não foi possível inicializar o Firebase",
              textDirection: TextDirection.ltr,
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return AppFireBase();
        } else {
          return Material(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
