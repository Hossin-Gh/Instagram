import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Const/Consts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_application_1/Screens/share_bottomSheet.dart';

class HomeScr extends StatelessWidget {
  const HomeScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 18),
            height: 24,
            width: 24,
            child: Image.asset('images/icon_direct.png'),
          )
        ],
        elevation: 0,
        backgroundColor: BlackColor,
        title: Container(
          height: 24,
          width: 125,
          child: Image.asset('images/moodinger_logo.png'),
        ),
      ),
      backgroundColor: BlackColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: _getStoryListView(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 30),
                      _getPostHeader(),
                      SizedBox(height: 20),
                      getPost(context),
                    ],
                  );
                },
                childCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getPost(context) {
    return Container(
      height: 430,
      width: 384,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: MediaQuery.of(context).size.width - 20,
                height: 394,
                child: Image(
                  image: AssetImage(
                    'images/item5.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Icon(
              Icons.smart_display,
              color: WhiteColor,
            ),
          ),
          Positioned(
            bottom: 5,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  height: 46,
                  width: 340,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/icon_hart.png'),
                          SizedBox(width: 6),
                          Text(
                            '2.6 k',
                            style: TextStyle(
                              color: WhiteColor,
                              fontFamily: 'GB',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset('images/icon_comments.png'),
                          SizedBox(width: 6),
                          Text(
                            '1.5 k',
                            style: TextStyle(
                              color: WhiteColor,
                              fontFamily: 'GB',
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            barrierColor: Colors.transparent,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom:
                                      MediaQuery.of(context).viewInsets.bottom,
                                ),
                                child: (DraggableScrollableSheet(
                                  initialChildSize: 0.5,
                                  minChildSize: 0.2,
                                  maxChildSize: 0.7,
                                  builder: ((context, Controller) {
                                    return ShareBottomSheet(
                                        controler: Controller);
                                  }),
                                )),
                              );
                            },
                          );
                        },
                        child: Image.asset('images/icon_share.png'),
                      ),
                      Image.asset('images/icon_save.png')
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getStoryListView() {
    return Container(
      height: 118,
      child: ListView.builder(
        itemCount: 9,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return index == 0 ? _getAddStory() : _getStoryList();
        },
      ),
    );
  }

  Widget _getPostHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          _getStory(),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Arman Gholami',
                  style: TextStyle(
                    color: WhiteColor,
                    fontFamily: 'GB',
                  ),
                ),
                Text(
                  'برنامه نویس فلاتر',
                  style: TextStyle(
                    color: WhiteColor,
                    fontFamily: 'SM',
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            color: WhiteColor,
          ),
        ],
      ),
    );
  }

  Widget _getStory() {
    return DottedBorder(
      borderType: BorderType.Circle,
      radius: Radius.circular(40),
      padding: EdgeInsets.all(4),
      color: PinkColor,
      dashPattern: [25, 10],
      strokeWidth: 2,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          height: 38,
          width: 38,
          child: Image.asset(
            'images/profile.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _getStoryList() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            borderType: BorderType.Circle,
            radius: Radius.circular(40),
            padding: EdgeInsets.all(4),
            color: PinkColor,
            dashPattern: [25, 10],
            strokeWidth: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              child: Container(
                height: 58,
                width: 58,
                child: Image.asset(
                  'images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Arman',
            style: TextStyle(color: WhiteColor, fontFamily: 'GBS'),
          ),
        ],
      ),
    );
  }

  Widget _getAddStory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: WhiteColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: BlackColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset('images/icon_plus.png'),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Your Story',
            style: TextStyle(color: WhiteColor, fontFamily: 'GBS'),
          ),
        ],
      ),
    );
  }
}
