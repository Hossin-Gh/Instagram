import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';

import 'main_screen.dart';

class LoginScr extends StatefulWidget {
  const LoginScr({super.key});

  @override
  State<LoginScr> createState() => _LoginScrState();
}

class _LoginScrState extends State<LoginScr> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            PurpleColor,
            PinkColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.center,
          children: [
            _getImage(),
            _getBox(focusNode1, focusNode2, context),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
  }
}

Widget _getImage() {
  return Positioned(
    left: 0,
    bottom: 0,
    right: 0,
    top: 40,
    child: Column(
      children: [
        Expanded(
          child:
              Container(child: Image(image: AssetImage('images/rocket.png'))),
        ),
        Expanded(
          child: Container(
              //color: Colors.transparent,
              ),
        ),
      ],
    ),
  );
}

Widget _getBox(FocusNode focus1, FocusNode focus2, context) {
  return SingleChildScrollView(
    child: Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Expanded(
            child: Container(
                //color: Colors.transparent,
                ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: BlackColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sing in to ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'GB',
                        ),
                      ),
                      Image(image: AssetImage('images/mood.png'))
                    ],
                  ),
                  SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      focusNode: focus1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 16,
                          color: focus1.hasFocus
                              ? PinkColor
                              : WhiteColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: GreyColor,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: PinkColor,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      focusNode: focus2,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontFamily: 'GB',
                          fontSize: 16,
                          color: focus2.hasFocus ? PinkColor : WhiteColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: GreyColor,
                            width: 3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            color: PinkColor,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    height: 46,
                    width: 129,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScr(),
                            ));
                      },
                      child: Text('sing in'),
                    ),
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t hane an account? ',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 16,
                          fontFamily: 'GB',
                        ),
                      ),
                      Text(
                        '\/Sing up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'GB',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
