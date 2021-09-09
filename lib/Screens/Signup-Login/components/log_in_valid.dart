import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Screens/HomeScreen/homepage.dart';

class LoginAuthProvider with ChangeNotifier {
  bool loading = false;
  UserCredential? userCredential;
  void loginPageValidation({
    required TextEditingController? email,
    required TextEditingController? password,
    required BuildContext context,
  }) async {
    if (!EmailValidator.validate(email!.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email address is invalid or empty'),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    } else if (password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password is empty"),
        ),
      );
      return;
    } else if (password.text.length <= 7) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password is invalid'),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        ),
      );
      return;
    } else {
      try {
        loading = true;
        notifyListeners();
        userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) async {
          loading = false;
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        });
        notifyListeners();
      } on FirebaseAuthException catch (e) {
        print(e);
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('You are not registered, please SignUp..BC'),
            ),
          );
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('The password is invalid'),
            ),
          );
        }
      }
    }
  }
}
