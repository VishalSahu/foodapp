import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Screens/Signup-Login/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                    );
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Center(
        child: Text('Homepage'),
      ),
    );
  }
}
