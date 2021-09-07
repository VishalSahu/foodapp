import 'package:flutter/material.dart';
import 'package:foodapp/Constants/constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Text(
            'GoFood',
            style: TextStyle(
                color: Colors.white, fontSize: 26, fontWeight: FontWeight.w900),
          ),
        ),
      ),
    );
  }
}
