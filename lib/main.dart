import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Constants/constants.dart';
import 'package:foodapp/Screens/Signup-Login/components/sign_up_auth.dart';
import 'package:foodapp/Screens/Signup-Login/signup.dart';
import 'package:foodapp/Screens/welcome.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              GoogleFonts.comfortaaTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
              color: kBackgroundColor,
              iconTheme: IconThemeData(color: kPrimaryColor)),
        ),
        home: AnimatedSplashScreen(
          splash: WelcomeScreen(),
          nextScreen: SignUp(),
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
