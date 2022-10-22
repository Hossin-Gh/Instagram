import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';
import 'package:flutter_application_1/Screens/activity_Screen.dart';
import 'package:flutter_application_1/Screens/addPost_Screen.dart';
import 'package:flutter_application_1/Screens/home_Screen.dart';
import 'package:flutter_application_1/Screens/profile_Screen.dart';
import 'package:flutter_application_1/Screens/search_Screen.dart';

import 'Switch_account.dart';

class MainScr extends StatefulWidget {
  const MainScr({super.key});

  @override
  State<MainScr> createState() => _MainScrState();
}

class _MainScrState extends State<MainScr> {
  int _selectedBottomItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: BlackColor,
            currentIndex: _selectedBottomItem,
            onTap: (int index) {
              setState(() {
                _selectedBottomItem = index;
              });
            },

            //
            showSelectedLabels: false,
            showUnselectedLabels: false,

            items: [
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_home.png'),
                activeIcon: Image.asset('images/icon_active_home.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_search_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_search_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_add_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_add_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset('images/icon_activity_navigation.png'),
                activeIcon:
                    Image.asset('images/icon_activity_navigation_active.png'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: GestureDetector(
                  onLongPress: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SwitchAccoubtScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: GreyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        child: Image.asset('images/1.png'),
                      ),
                    ),
                  ),
                ),
                activeIcon: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: PinkColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Image.asset('images/1.png'),
                    ),
                  ),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedBottomItem,
        children: _getLayout(),
      ),
    );
  }
}

List<Widget> _getLayout() {
  return <Widget>[
    HomeScr(),
    SearchScr(),
    AddPost(),
    ActivityScr(),
    UserProfileScr(),
  ];
}
