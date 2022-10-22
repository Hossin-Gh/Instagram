// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/Login_Screen.dart';
import 'package:flutter_application_1/Screens/Switch_account.dart';
import 'package:flutter_application_1/Screens/activity_Screen.dart';
import 'package:flutter_application_1/Screens/addPost_Screen.dart';
import 'package:flutter_application_1/Screens/home_Screen.dart';
import 'package:flutter_application_1/Screens/main_screen.dart';
import 'package:flutter_application_1/Screens/profile_Screen.dart';
import 'package:flutter_application_1/Screens/search_Screen.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'GB',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Color(0xfff35383),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            textStyle: TextStyle(
              fontFamily: 'GB',
              fontSize: 16,
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      //home: SplashScr(),
      //home: SwitchAccoubtScreen(),
      home: LoginScr(),
      //home: HomeScr(),
      //home: SearchScr(),
      //home: AddPost(),
      //home: ActivityScr(),
      //home: UserProfileScr(),
      //home: MainScr(),
    );
  }
}

class SplashScr extends StatelessWidget {
  const SplashScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('images/pattern1.png'),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 136),
                child: Center(
                  child: Image(
                    image: AssetImage('images/logo_splash.png'),
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                child: Column(
                  children: [
                    Text(
                      'from',
                      style: TextStyle(color: Colors.grey[300], fontSize: 12.0),
                    ),
                    Text(
                      'ExperFlutter',
                      style:
                          TextStyle(color: Colors.blueAccent, fontSize: 12.0),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
