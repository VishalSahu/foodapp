import 'package:flutter/material.dart';
import 'package:foodapp/Constants/constants.dart';
import 'package:foodapp/Screens/Signup-Login/components/sign_up_auth.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool visibility = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SignupAuthProvider signupAuthProvider = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 40),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: size.width * 0.065,
                  ),
                  Text(
                    'Welcome to GoFood!',
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
                      controller: name,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(height: 1.5),
                        prefixIcon: new Icon(Icons.person),
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
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(height: 1.5),
                        prefixIcon: new Icon(Icons.email),
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
                      controller: password,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: visibility,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(height: 1.5),
                        prefixIcon: new Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              visibility = !visibility;
                            });
                          },
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
                    onPressed: () {
                      signupAuthProvider.signupvalidation(
                          fullname: name,
                          email: email,
                          password: password,
                          context: context);
                    },
                    child: signupAuthProvider.loading == false
                        ? Text('Sign Up')
                        : Center(
                            child: SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ),
                            ),
                          ),
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
                              left: size.width * 0.08,
                              right: size.width * 0.04),
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
                              left: size.width * 0.04,
                              right: size.width * 0.08),
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
                      Text('Already have an account? '),
                      TextButton(
                        onPressed: () {},
                        child: Text('Sign In'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
