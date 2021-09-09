import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Screens/HomeScreen/homepage.dart';

class SignupAuthProvider with ChangeNotifier {
  void signup() {
    print('Sign Up doing');
  }

  UserCredential? userCredential;
  bool loading = false;

  void signupvalidation({
    required TextEditingController? fullname,
    required TextEditingController? email,
    required TextEditingController? password,
    required BuildContext context,
  }) async {
    if (fullname!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fullname is empty'),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        ),
      );
      return;
    } else if (!EmailValidator.validate(email!.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email address is invalid or empty'),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
        ),
      );
      return;
    } else if (password!.text.length <= 7) {
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
        userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        loading = true;
        notifyListeners();
        FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential!.user!.uid)
            .set({
          'Full Name': fullname.text,
          'Email ID': email.text,
          'Pass Key': password.text,
          'User UID': userCredential!.user!.uid,
        }).then(
          (value) {
            loading = false;
            notifyListeners();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        );
      } on FirebaseAuthException catch (e) {
        loading = false;
        notifyListeners();
        print(e);
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Enter a strong password.'),
            ),
          );
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('This email address is already registered.'),
            ),
          );
        }
      }
    }
  }
}
