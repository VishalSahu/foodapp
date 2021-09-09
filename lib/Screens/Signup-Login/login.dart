import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodapp/Constants/constants.dart';
import 'package:foodapp/Screens/Signup-Login/components/log_in_valid.dart';
import 'package:foodapp/Screens/Signup-Login/signup.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    LoginAuthProvider loginAuthProvider =
        Provider.of<LoginAuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: size.width * 0.07, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: size.height * 0.07,
                ),
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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(height: 1.5),
                      prefixIcon: new Icon(
                        Icons.email,
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
                    controller: passwordController,
                    obscureText: visible,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(height: 1.5),
                      prefixIcon: new Icon(
                        Icons.lock,
                        color: kPrimaryColor,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                            visible ? Icons.visibility_off : Icons.visibility,
                            color: kPrimaryColor),
                        onPressed: () {
                          setState(() {
                            visible = !visible;
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
                    loginAuthProvider.loginPageValidation(
                        email: emailController,
                        password: passwordController,
                        context: context);
                  },
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
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
