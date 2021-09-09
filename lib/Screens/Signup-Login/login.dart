import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/Constants/constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Welcome back!',
                style: TextStyle(
                  fontSize: 22,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    hintStyle: TextStyle(height: 1.5),
                    prefixIcon: Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 25,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.065,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                child: TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(height: 1.5),
                    prefixIcon: new Icon(
                      Icons.lock,
                      color: kPrimaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.visibility, color: kPrimaryColor),
                      onPressed: () {},
                    ),
                    border: InputBorder.none,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 5),
                      blurRadius: 25,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.width * 0.10,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Login'),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                    elevation: 4,
                    shadowColor: Colors.grey.shade100,
                    primary: Colors.white,
                    backgroundColor: kPrimaryColor,
                    padding: EdgeInsets.all(12)),
              ),
              SizedBox(
                height: size.width * 0.10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.08, right: size.width * 0.04),
                      child: Divider(
                        color: Colors.black54,
                        thickness: 0.6,
                      ),
                    ),
                  ),
                  Text("OR"),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.04, right: size.width * 0.08),
                      child: Divider(
                        color: Colors.black54,
                        thickness: 0.6,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.width * 0.10,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Continue with Facebook'),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    elevation: 4,
                    shadowColor: Colors.grey.shade100,
                    primary: Colors.white,
                    backgroundColor: Color(0xff476FB0),
                    padding: EdgeInsets.all(12)),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextButton(
                onPressed: () {},
                child: Text('Continue with Google'),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                    elevation: 4,
                    shadowColor: Colors.grey.shade100,
                    primary: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(12)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? '),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
